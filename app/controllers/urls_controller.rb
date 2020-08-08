# frozen_string_literal: true

class UrlsController < ApplicationController
  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    @url = Url.create(url_params)
    @urls = Url.all.limit(10)
  end

  def show
    @url = Url.find(params[:id])
    # implement queries
    @daily_clicks = Url.group('DATE(created_at)').count.map { |date, count| [date.strftime('%b %d, %Y'), count] }
    @browsers_clicks = Click.group('browser').count.to_a
    @platform_clicks = Click.group('platform').count.to_a
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
