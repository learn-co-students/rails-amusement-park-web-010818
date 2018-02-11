Rails.application.routes.draw do

  root "application#hello"
  resources :users

  resources :attractions
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :rides, only: [:create]

end
