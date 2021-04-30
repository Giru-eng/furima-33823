Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'items#index'
end
