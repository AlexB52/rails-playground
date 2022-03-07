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
        # Write Ruby as if you were in a rails console.
        # Press cmd+Enter or ctrl+Enter on selected code to run it in the console.

        1+1
      SCRIPT

      render :show
    end

    private

    def script_path(name)
      script_paths.find { |path| path == name }
    end

    def script_paths
      Dir[Rails.root.join("lib", "playgrounds", "**", "*")]
        .reject {|fn| File.directory?(fn) }
    end
  end
end
