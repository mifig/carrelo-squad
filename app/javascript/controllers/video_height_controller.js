import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="video-height"
export default class extends Controller {

  static targets = ["youtubeFrame", "vimeoFrame"]

  connect() {
    if (document.querySelector(".youtube-frame")) {
      this.youtubeFrameTargets.forEach((frame) => {
        frame.height = frame.offsetWidth * (9 / 16)
      })
    }

    if (document.querySelector(".vimeo-frame")) {
      this.vimeoFrameTargets.forEach((frame) => {
        frame.height = frame.offsetWidth * (9 / 16)
      })
    }
  }

  setVideoHeight() {
    if (document.querySelector(".youtube-frame")) {
      this.youtubeFrameTargets.forEach((frame) => {
        frame.height = frame.offsetWidth * (9 / 16)
      })
    }

    if (document.querySelector(".vimeo-frame")) {
      this.vimeoFrameTargets.forEach((frame) => {
        frame.height = frame.offsetWidth * (9 / 16)
      })
    }
  }
}
