Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    member do
    resources :item_purchases, only: [:index, :create]
    end
  end
end
