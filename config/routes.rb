Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'

  resources :users, only: [:edit, :update, :show]
  resources :prototypes

  scope module: :prototypes do
    resources :popular, only: :index
    resources :newest, only: :index
  end
end
