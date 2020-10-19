Rails.application.routes.draw do
  get 'users/show'
  get 'cards/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :users
  resources :items do
    resources :orders
  end
  resources :cards, only: [:new, :create, :destroy]
end
