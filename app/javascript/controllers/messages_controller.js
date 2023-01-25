import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {

  static targets = ["form", "closeBtn"]

  sendMessage(event) {
    event.preventDefault()
    const csrf = document.querySelector('meta[name="csrf-token"]').content

    fetch(this.formTarget.action, 
      {
        method: "POST",
        headers: {
          "X-CSRF-TOKEN": csrf,
          "Accept": "text/plain"
        },
        body: new FormData(this.formTarget)
      })
      .then(response => response.text())
      .then((data) => {
        this.formTarget.outerHTML = data
        
        if(document.querySelector(".invalid-feedback") == null) {
          this.closeBtnTarget.click()

          const contacts = document.getElementById("contacts")
          
          contacts.insertAdjacentHTML("afterend", `<div class="alert alert-info alert-dismissible fade show m-1" role="alert">
            Mensagem enviada!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close">
            </button>
          </div>`)

          const email = this.formTarget.elements["message_email"]
          email.value = ""
          email.style.backgroundImage = "none"

          const subject = this.formTarget.elements["message_subject"]
          subject.value = ""
          subject.style.backgroundImage = "none"

          const content = this.formTarget.elements["message_content"]
          content.value = ""
          content.style.backgroundImage = "none"
        }
      })
  }

  markAsRead(event) {
    event.preventDefault()
    const csrf = document.querySelector('meta[name="csrf-token"]').content

    fetch(event.currentTarget.dataset.href, 
      {
        method: "PATCH",
        headers: { 
          "X-CSRF-TOKEN": csrf,
          "Accept": "application/json"
        }
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.message === "Mensagem lida!") {
          this.element.classList.add("message-read")
          const messageCounter = document.querySelector(".unread-messages-counter")
          messageCounter.innerHTML = parseInt(messageCounter.innerHTML) - 1
          document.getElementById(`message-read-icon-${data.messageId}`).innerHTML = "<i class='fa-solid fa-envelope'></i>"

          if (messageCounter.innerHTML === "0") {
            messageCounter.classList.add("d-none")
          }
        }
      })
  }

  markAsUnread(event) {
    event.preventDefault()
    const csrf = document.querySelector('meta[name="csrf-token"]').content

    fetch(event.currentTarget.dataset.href, 
      {
        method: "PATCH",
        headers: { 
          "X-CSRF-TOKEN": csrf,
          "Accept": "application/json"
        }
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if(data.message === "Mensagem marcada como não lida!") {
          this.element.classList.remove("message-read")
          
          let messageCounter = document.querySelector(".unread-messages-counter")
          messageCounter.innerHTML = parseInt(messageCounter.innerHTML) + 1
          document.getElementById(`message-read-icon-${data.messageId}`).innerHTML = "<i class='fa-solid fa-envelope-open'></i>"
  
          if (messageCounter.innerHTML !== "0") {
            messageCounter.classList.remove("d-none")
          }
        }
      })
  }
}
