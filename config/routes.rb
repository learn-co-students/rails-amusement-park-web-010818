Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :attractions
  resources :rides
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'application#home'
end
