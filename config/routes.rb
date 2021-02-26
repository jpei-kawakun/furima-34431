Rails.application.routes.draw do
  devise_for :items
  resources :prototypes, only: :index
  root to: "items#index"
  devise_for :users
end
