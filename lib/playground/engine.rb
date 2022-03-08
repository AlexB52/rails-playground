module Playground
  class Engine < ::Rails::Engine
    isolate_namespace Playground

    # If you don't want to precompile Turbo's assets (eg. because you're using webpack),
    # you can do this in an intiailzer:
    #
    # config.after_initialize do
    #   config.assets.precompile -= Turbo::Engine::PRECOMPILE_ASSETS
    # end
    PRECOMPILE_ASSETS = %w( application.js application.css )

    initializer "playground.assets" do |app|
      # if app.config.respond_to?(:assets)
      #   app.config.assets.precompile += PRECOMPILE_ASSETS
      # end
      app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/vendor")
    end

    # initializer "playground.helpers", before: :load_config_initializers do
    #   ActiveSupport.on_load(:action_controller_base) do
    #     include Turbo::Streams::TurboStreamsTagBuilder, Turbo::Frames::FrameRequest, Turbo::Native::Navigation
    #     helper Turbo::Engine.helpers
    #   end
    # end
  end
end
