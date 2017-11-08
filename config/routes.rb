Rails.application.routes.draw do

  get 'items/create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'users#show'

  get 'index', to: 'home#index'

  resources :users do
    resources :items, only: [:new, :create]
  end
end
