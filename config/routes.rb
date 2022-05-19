Rails.application.routes.draw do
  root 'properties#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :properties
  resources :brokers
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
