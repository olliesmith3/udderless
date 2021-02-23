Rails.application.routes.draw do
  match '/customers/:customer_id/orders/:id/complete' => 'orders#complete', as: 'complete_order', via: :put 
  match '/customers/:customer_id/orders/:id/undo_complete' => 'orders#undo_complete', as: 'undo_complete_order', via: :put 
  match '/customers/:customer_id/orders/:id/cancel' => 'orders#cancel', as: 'cancel_order', via: :put 
  match '/customers/:customer_id/orders/:id/undo_cancel' => 'orders#undo_cancel', as: 'undo_cancel_order', via: :put
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :customers do
    resources :orders
  end
  namespace :api do 
    namespace :customer_portal_v1 do 
     resources :interests, only: [:index, :create]
    end 
  end
end
