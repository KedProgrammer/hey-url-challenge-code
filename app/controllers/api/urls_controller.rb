# frozen_string_literal: true
module Api
  class UrlsController < ApplicationController
    def index
      @urls = Url.includes(:clicks).limit(10)
    end
  end
end