Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  
  resources :products do
    #get 'edit', on: :member
    #resources :orders, only: [:create]
    patch '/', action: :update, on: :member
    #post 'orders', to: 'orders#create'
  end
end