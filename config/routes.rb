Rails.application.routes.draw do
  devise_for :items
  resources :prototypes, only: [:index, :new, :create]
  root to: "items#index"
  devise_for :users
end
