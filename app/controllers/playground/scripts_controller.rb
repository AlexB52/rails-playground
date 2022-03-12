module Playground
  class ScriptsController < ApplicationController
    def index
      @scripts = script_paths

      if params[:name]
        @scripts = @scripts.select { |script| script.downcase.match? params[:name].downcase }
      end
    end

    def show
      @_script = File.read script_path(params[:name])
    end

    def new
      @_script = <<~SCRIPT
      # Access your application domain as if you were in a rails console.
      # There are three ways to run code in the console:

      # 1 - Select all the code from line 5 to 11 and press cmd+Enter
      module HelloWorld
        module_function

        def hello
          "Hello, World!"
        end
      end

      # 2 - Put your cursor on line 14 (no selection) and press cmd+Enter
      HelloWorld.hello

      # 3 - Type "HelloWorld.hello" in the terminal box below and press cmd+Enter
      SCRIPT

      render :show
    end

    private

    def script_path(name)
      script_paths.find { |path| path == name }
    end

    def script_paths
      Dir[Rails.root.join("lib", "playground", "**", "*")]
        .reject {|fn| File.directory?(fn) }
    end
  end
end
