# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlsController, type: :request do
  describe 'GET #index' do
    let!(:url) { create_list(:url, 20, :skip_validate) }

    before do
      get '/api/urls', headers: headers
      @response = JSON.parse(response.body)
    end

    it 'shows the latest 10 URLs' do
      expect(@response['data'].count).to eq(10)
    end

    it 'has right json response' do
      expect(@response).to have_key('data')
      expect(@response['data'].first).to have_key('type')
      expect(@response['data'].first).to have_key('id')
      expect(@response['data'].first).to have_key('attributes')
      expect(@response['data'].first['attributes']).to have_key('created_at')
      expect(@response['data'].first['attributes']).to have_key('url')
      expect(@response['data'].first['attributes']).to have_key('clicks')
    end

    it 'response ok' do
      expect(response).to have_http_status(:ok)
    end
  end
end
