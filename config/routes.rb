Rails.application.routes.draw do
  resources :authentications
  resources :users, only: [:create]
  post "login", to: "authentication#login"
  resources :personal_collection, only: [:index]
end
