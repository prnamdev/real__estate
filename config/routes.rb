Rails.application.routes.draw do
  root 'properties#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :properties
  resources :brokers
  resources :clients
  resources :properties do
    resources :interests, only: [:create, :destroy]
  end

  get 'interests/interest/:property_id', to: "interests#interest", as: :interests_interest
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
