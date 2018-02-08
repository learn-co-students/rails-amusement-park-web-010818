Rails.application.routes.draw do
  root 'welcome#home'
  resources :rides
  resources :users
  resources  :attractions
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  # get '/users/:id', to: 'users#show'
  # get '/signup', to: 'users#new'
  # post '/signup', to: 'users#create'
  delete '/signout', to: 'sessions#destroy'
end
