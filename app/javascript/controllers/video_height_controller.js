import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="video-height"
export default class extends Controller {

  static targets = ["youtubeFrame", "vimeoFrame"]

  connect() {
    this.youtubeFrameTarget.height = this.youtubeFrameTarget.offsetWidth * (9 / 16)
    this.vimeoFrameTarget.height = this.vimeoFrameTarget.offsetWidth * (9 / 16)
  }

  setVideoHeight() {
    this.youtubeFrameTarget.height = this.youtubeFrameTarget.offsetWidth * (9 / 16)
    this.vimeoFrameTarget.height = this.vimeoFrameTarget.offsetWidth * (9 / 16)
  }
}
