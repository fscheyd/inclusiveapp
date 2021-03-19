Rails.application.routes.draw do
  
  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  match '/auth/gmail/callback', to: 'sessions#omniauth', via: [:get, :post]
  
  resources :businesses do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :users 

  resources :reviews

end
  
  

