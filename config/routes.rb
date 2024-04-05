Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  
  resources :products do
    post 'orders', to: 'orders#create'
  end
end