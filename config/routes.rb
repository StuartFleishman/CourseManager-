Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#welcome'

  resources :notes 

  resources :courses do
    resources :notes, only: [:index, :new, :create]
  end

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  resources :users, :only => [:new, :create]

  get '/auth/:provider/callback', to: 'sessions#omniauth'

  post '/logout', to: 'sessions#destroy'
end
