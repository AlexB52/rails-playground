require "application_system_test_case"

module Playground
  class ConsolesTest < ApplicationSystemTestCase
    include Engine.routes.url_helpers

    test "visiting the index" do
      visit root_path

      assert_selector "h1", text: "Playground"
    end
  end
end
