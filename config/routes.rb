Rails.application.routes.draw do
  resources :portraits, :only => [:new, :create]

  get :entries, to: 'portraits#entries'

  root 'portraits#new'
end