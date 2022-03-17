import "@hotwired/turbo-rails"
import "@rails/request.js"
import { Application } from "@hotwired/stimulus"

import HelloController from "./controllers/hello_controller"
import PlaygroundController from "./controllers/playground_controller"
import SearchScriptsController from "./controllers/search_scripts_controller"
import SelectScriptController from "./controllers/select_script_controller"
import CodemirrorController from "./controllers/codemirror_controller"

window.Stimulus = Application.start()

Stimulus.register("hello", HelloController)
Stimulus.register("playground", PlaygroundController)
Stimulus.register("search-scripts", SearchScriptsController)
Stimulus.register("select-script", SelectScriptController)
Stimulus.register("codemirror", CodemirrorController)
