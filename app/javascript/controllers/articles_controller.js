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
        const articles = Array.from(event.target.children)
        
        for(let i = 0; i < articles.length; i++ ) {
          let form = articles[i].children[0]
          let articleParams = { "article": 
            { "order_id": i }
          }
          
          fetch(form.action, {
            method: "PATCH",
            headers: { 
              "X-CSRF-TOKEN": csrf,
              "Content-Type": "application/json",
              "Accept": "application/json"
            },
            body: JSON.stringify(articleParams)
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
