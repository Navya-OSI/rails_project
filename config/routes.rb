Rails.application.routes.draw do
  get 'users/index'
  root 'products#index'
  devise_for :users
  resources :products, only: [:new, :create, :index, :show]
  resources :reviews, only: [:index, :new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
