Rails.application.routes.draw do
  devise_for :items
  resources :items, only: [:index, :new, :create]
  root to: "items#index"
  devise_for :users
end
