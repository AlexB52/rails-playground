require "test_helper"

module Playground
  class ConsolesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "GET #show" do
      get root_path

      assert_response :success
    end
  end
end
