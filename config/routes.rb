Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'users#welcome'

  resources :courses do
    resources :notes, only: [:index, :new]
  end

  resources :sessions 

  resources :users 
end
