# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'urls#index'

  resources :urls, only: %i[index create show] do
    resources :clicks, only: :create
  end

  namespace :api do
    defaults format: :json do
      resources :urls, only: :index
    end
  end

  get ':url', to: 'urls#visit', as: :visit
end
