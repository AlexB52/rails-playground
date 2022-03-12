require "debug"
require "web-console"

WebConsole::View.class_eval do
  def playground_page?
    @playground_page ||= begin
      # {:controller=>"playground/consoles", :action=>"show"}
      path_parameters = @env["action_dispatch.request.path_parameters"]
      path_parameters[:controller] == "playground/consoles" &&
      path_parameters[:action] == "show"
    end
  end
end

require "turbo-rails"
require "playground/version"
require "playground/engine"

module Playground

end
