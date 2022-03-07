module Playground
  class Engine < ::Rails::Engine
    isolate_namespace Playground

    initializer "blorgh.assets.precompile" do |app|
      app.config.assets.precompile += %w( application.js application.css )
    end
  end
end
