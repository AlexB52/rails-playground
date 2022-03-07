import "@hotwired/turbo-rails"
import "@rails/request.js"
import { Application } from "@hotwired/stimulus"

import HelloController from "./controllers/hello_controller"

window.Stimulus = Application.start()
Stimulus.register("hello", HelloController)
