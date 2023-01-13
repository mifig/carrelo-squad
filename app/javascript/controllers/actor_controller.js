import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="actor"
export default class extends Controller {

  static targets = [ "form", "cvPtButton", "cvEnButton", "photoButton", "primaryPhoto", "photosButton" ]

  sendForm() {
    this.formTarget.submit()
  }

  uploadPtCv(event) {
    const file = event.currentTarget.files[0]
    this.cvPtButtonTarget.innerHTML = file.name
  }

  uploadEnCv(event) {
    const file = event.currentTarget.files[0]
    this.cvEnButtonTarget.innerHTML = file.name
  }

  uploadPrimaryPhoto(event) {
    const file = event.currentTarget.files[0]
    this.photoButtonTarget.innerHTML = file.name

    const previewer = this.primaryPhotoTarget
    console.log(previewer)
    previewer.style.backgroundImage = `url(${URL.createObjectURL(file)})`
  }

  uploadPhotos(event) {
    const file = event.currentTarget.files
    this.photosButtonTarget.innerHTML = `${file.length} Files`
    document.querySelectorAll(".hidden-photos").forEach(element => {
      element.remove()
    });
  }
}
