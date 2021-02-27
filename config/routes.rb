Rails.application.routes.draw do
  
  root "static#home"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "user"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :businesses do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :users do
    resources :reviews, only: [:index, :new, :create, :destroy]
end
  
  

