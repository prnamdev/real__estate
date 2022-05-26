Rails.application.routes.draw do
  root 'properties#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :properties do
    resources :interests, only: [:create, :destroy]
  end

  get 'broker',  to: 'properties#broker'
  get 'client',  to: 'properties#client'
  get 'interests/interest/:property_id', to: "interests#interest", as: :interests_interest
end
