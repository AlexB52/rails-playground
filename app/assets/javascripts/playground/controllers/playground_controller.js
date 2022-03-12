import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.console = REPLConsole.installInto('console')
  }

  runCode(event) {
    this.console.setInput(event.detail.selection)
    this.console.onEnterKey()
  }
}
