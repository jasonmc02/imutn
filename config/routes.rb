Rails.application.routes.draw do
  resources :portraits, :only => [:new, :create]

  root 'portraits#new'
end
