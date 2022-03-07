import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['textarea']

  connect() {
    this.console = REPLConsole.installInto('console')
  }

  runCode(event) {
    if (this.cmdEnter(event) && this.selection != "") {
      this.console.setInput(this.selection)
      this.console.onEnterKey()
    }
  }

  get selection() {
    return this.textareaTarget.value.substring(
      this.textareaTarget.selectionStart,
      this.textareaTarget.selectionEnd
    )
  }

  cmdEnter(event) {
    return (event.metaKey || event.ctrlKey) && event.keyCode == 13
  }
}
