module Playground
  class ConsolesController < ApplicationController
    layout 'playground/editor'

    def show
      console
    end
  end
end
