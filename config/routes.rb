Rails.application.routes.draw do
  devise_for :users
  root to: 'urls#index'
  resources :users, only: [:edit, :update]
  resources :urls, only: [:new, :create]
  resources :categories, only: [:new, :create]
end
