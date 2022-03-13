require "application_system_test_case"

module Playground
  class ConsolesTest < ApplicationSystemTestCase
    include Engine.routes.url_helpers

    test "visiting the playground" do
      visit root_path
      assert_selector "h1", text: "Playground"
    end

    test "using the console" do
      visit root_path

      assert_selector "#console"
      find('#console').click
      send_keys %Q{"Hello, World!"}
      send_keys :return
      assert_text %Q{=> "Hello, World!"}
    end

    test "using the editor to run code" do
      visit root_path

      assert_selector ".cm-editor"
      find('.cm-editor').click

      # run a selected block
      send_keys [:command, 'a'], [:command, :return]
      assert_text %Q{=> "Hello, World!"}

      # run a single line
      first(".cm-line", text: 'HelloWorld.hello').click
      send_keys [:command, :return]
      assert_text <<~EXPECTED.strip
      => "Hello, World!"
      >> HelloWorld.hello
      => "Hello, World!"
      >>
      EXPECTED
    end
  end
end
