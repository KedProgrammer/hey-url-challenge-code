# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe 'GET #index' do
    it 'shows the latest 10 URLs' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'creates an url' do
      count = Url.all.count
      post :create, params: { url: {original_url: 'http://www.google.com' } }, xhr: true
      expect(Url.all.count).to eql(count + 1)
    end

    it 'creates an url' do
      url = Url.create(original_url: 'http://www.google.com')
      get :show, params: { id: url.id }
      expect(response).to render_template(:show)
    end
  end
end
