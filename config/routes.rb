Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'

  resources :users, only: [:edit, :update, :show]
  resources :prototypes do
    collection do
      get 'popular'
      get 'newest'
    end
  end
end
