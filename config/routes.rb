Rails.application.routes.draw do
  devise_for :users
  get 'products/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "products#index"
    resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
      resources :orders, only: [:index, :create]
    end
end