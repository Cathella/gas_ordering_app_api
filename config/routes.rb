Rails.application.routes.draw do
  get 'products/index'
  resources :orders, only: [:index, :show, :create, :update, :destroy] do
    get :status, on: :member
    get :history, on: :collection
  end

  resources :products, only: [:index]
end
