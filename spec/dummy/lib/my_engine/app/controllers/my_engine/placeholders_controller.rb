module MyEngine
  class PlaceholdersController < ApplicationController
    def show
      render text: 'PLACEHOLDER'
    end
  end
end