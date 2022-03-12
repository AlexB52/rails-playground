import { Controller } from "@hotwired/stimulus"
import { EditorView, keymap } from "@codemirror/view"
import { EditorState, Prec } from "@codemirror/state"
import { basicSetup } from "@codemirror/basic-setup"
import { indentWithTab } from "@codemirror/commands"
import { StreamLanguage } from "@codemirror/stream-parser"
import { ruby } from "@codemirror/legacy-modes/mode/ruby"

export default class extends Controller {
  static values = { script: String }

  connect() {
    this.editor = new EditorView({
      parent: this.element,
      state: EditorState.create({
        doc: this.scriptValue,
        extensions: [
          basicSetup,
          StreamLanguage.define(ruby),
          Prec.high(keymap.of([{key: "Mod-Enter", run: () => this.submitCodeSelected}])),
          keymap.of([indentWithTab])
        ]
      })
    })
  }

  get submitCodeSelected() {
    const event = new CustomEvent('codeSubmission', { detail: { selection: this.selectedBlock } });
    this.element.dispatchEvent(event);
    return true
  }

  get selection() {
    return this.editor.state.selection.main
  }

  get doc() {
    return this.editor.state.doc
  }

  get selectedBlock() {
    const { from, to } = this.selection
    if (from != to) {
      return this.doc.toString().slice(from, to)
    } else {
      return this.doc.lineAt(from).text
    }
  }
}
