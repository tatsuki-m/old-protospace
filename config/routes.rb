Rails.application.routes.draw do
  root 'top#index'

  resources :top, only: :index
  resources :proto, only: [:index, :new]
  resources :user, only: [:index, :index, :edit]
  resources :login, only: :index
end
