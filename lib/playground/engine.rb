module Playground
  class Engine < ::Rails::Engine
    isolate_namespace Playground

    initializer "playground.web_console_templates" do |app|
      template_paths =  File.expand_path("../templates", __FILE__)
      WebConsole::Template.template_paths.unshift(*Array(template_paths))
    end

    initializer "playground.assets" do |app|
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/vendor")
    end
  end
end
