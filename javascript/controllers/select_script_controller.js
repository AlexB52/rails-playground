import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  getScript(event) {
    get(event.target.value)
  }
}
