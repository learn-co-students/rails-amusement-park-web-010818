Rails.application.routes.draw do
  resources :rides, :attractions, except: [:destroy]
  resources :users, except: [:create, :destroy]
  post '/users/new', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

  root :to => 'application#welcome'


end
