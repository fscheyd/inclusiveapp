Rails.application.routes.draw do
  root :to => "sessions#home"
  get 'sessions/home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "user"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :businesses

  resources :businesses do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews 
  
  resources :users do
    resources :reviews, only: [:index, :new, :create, :edit, :destroy]
  end
end

  

