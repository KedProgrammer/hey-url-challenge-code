# frozen_string_literal: true

class ClicksController < ApplicationController
  def create
    browser = Browser.new(request.headers['HTTP_USER_AGENT'], accept_language: "en-us")
    @url = Url.includes(:clicks).find(params[:url_id])
    click = @url.clicks.build
    click.browser = browser.name
    click.platform = browser.platform.name
    click.save
    redirect_to @url.original_url
  end
end
