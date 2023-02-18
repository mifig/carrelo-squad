import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="order-photos"
export default class extends Controller {
  static targets = ["photosContainer", "photo", "input", "form"]

  connect() {
    const csrf = document.querySelector('meta[name="csrf-token"]').content
    const photosArray = [...this.photosContainerTarget.children]
    let orderedPhotos = photosArray.map((photo) => {
      return photo.dataset.photoId
    })
    this.inputTarget.value = orderedPhotos

    new Sortable(this.photosContainerTarget, {
        ghostClass: "ghost",
        animation: 150,
        onEnd: (event) => {
          const newPhotosArray = [...this.photosContainerTarget.children]

          const newOrderedPhotos = newPhotosArray.map((photo) => {
            return photo.dataset.photoId
          })

          this.inputTarget.value = newOrderedPhotos
          
          fetch(this.formTarget.action, {
            method: "POST",
            headers: { 
              "X-CSRF-TOKEN": csrf,
              "Accept": "application/json" 
            },
            body: new FormData(this.formTarget)
          })
        }
      })
  }
}
