import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="articles"
export default class extends Controller {
  connect() {
    const csrf = document.querySelector('meta[name="csrf-token"]').content

    new Sortable(this.element, {
      ghostClass: "ghost",
      animation: 150,
      onEnd: (event) => {
        const videos = Array.from(event.target.children)
        console.log(videos)
        
        for(let i = 0; i < videos.length; i++ ) {
          let form = videos[i].children[1]
          console.log(form)
          let videoParams = { "link": 
            { "order_id": i }
          }
          
          fetch(form.action, {
            method: "PATCH",
            headers: { 
              "X-CSRF-TOKEN": csrf,
              "Content-Type": "application/json",
              "Accept": "application/json"
            },
            body: JSON.stringify(videoParams)
          })
            .then(response => response.json())
            .then((data) => {
              console.log(data)
            })
        }
      }
    })
  }
}
