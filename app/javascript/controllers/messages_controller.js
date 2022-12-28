import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {
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
          console.log(event.currentTarget)
          console.log(this.element)
          this.element.classList.add("message-read")
          const messageCounter = document.querySelector(".unread-messages-counter")
          messageCounter.innerHTML = parseInt(messageCounter.innerHTML) - 1

          if (messageCounter.innerHTML === "0") {
            messageCounter.remove()
          }
        }
      })
  }
}
