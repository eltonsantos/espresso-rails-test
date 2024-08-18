# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'

  resources :statements do
    member do
      patch :archive
    end
  end
  resources :cards, only: %i[index new create edit update]
  resources :users, only: %i[index new create edit update]
  devise_for :users, path: '',
                     path_names: { sign_up: 'sign_up' },
                     controllers: {
                       registrations: 'admin/registrations'
                     }

  resources :categories, only: %i[index new create edit update]
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :baas do
      post 'webhooks', to: 'webhooks#create'
    end
  end

  root to: 'statements#index'
end
