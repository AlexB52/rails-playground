module Playground
  class Engine < ::Rails::Engine
    isolate_namespace Playground

    initializer "playground.assets" do |app|
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/vendor")
    end
  end
end
