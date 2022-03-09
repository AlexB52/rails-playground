import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ['input']
  static values = { url: String }

  debounce(callback, time) {
    window.clearTimeout(this.debounceTimer);
    this.debounceTimer = window.setTimeout(callback, time);
  }

  getScripts(event) {
    let callback = () => get(this.urlValue, {
      query: { name: event.target.value }
    })

    this.debounce(callback, 500)
  }
}
