Rails.application.routes.draw do
  root :to => "sessions#home"
  get 'sessions/home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: "user"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#google'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  
  
  resources :businesses

  resources :businesses do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [:show, :index, :new, :create, :edit, :destroy]
  
  resources :users do
    resources :reviews, only: [:index, :new, :create, :edit, :destroy]
  end
end

  

