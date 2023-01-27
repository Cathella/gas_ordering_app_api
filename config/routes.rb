Rails.application.routes.draw do
  resources :products
  resources :users
  resources :orders
  resources :deliveries
  resources :payments, only: [:show, :create, :update]
end
