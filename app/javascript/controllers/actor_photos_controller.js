import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="actor-photos"
export default class extends Controller {
  slide(event) {
    const photoId = event.currentTarget.dataset.photoId

    if (window.innerWidth >= 1000) {
      document.querySelector(`[aria-label="Placeholder Slide ${parseInt(photoId) + 1}"]`).click()
    } else {
      document.getElementById("modal-btn").click()
      document.querySelector(`[aria-label="Slide ${parseInt(photoId) + 1}"]`).click()
    }
  }
}
