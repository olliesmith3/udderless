Rails.application.routes.draw do
  resources :orders
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :customers do
    resources :orders
  end
end
