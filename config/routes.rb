Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#welcome'

  resources :notes 

  resources :courses do
    resources :notes, only: [:index, :new, :create]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'


  get '/auth/:provider/callback', to: 'sessions#omniauth'


end
