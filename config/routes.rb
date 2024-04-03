Rails.application.routes.draw do
  devise_for :users
  root to: "tops#index"
  
  resources :products
end