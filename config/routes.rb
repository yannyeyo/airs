# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users
  root 'pages#about', as: 'home'
  get 'sessions/new', as: 'login'
  get 'users/index', as: 'all'
  get 'signings/airs', as: 'service'
  get 'pages/contacts', as: 'contacts'
  get 'signings/sign', as: 'zap'
  post 'signings/create_sign'
  get 'reviews/show', as: 'comm'
  post 'reviews/new'
  get 'my_air/show', as: 'records'
  post 'users/update'
  post 'users/create'
end

