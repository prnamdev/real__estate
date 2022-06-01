Rails.application.routes.draw do
  root 'properties#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :properties do
    resources :interests, only: [:index, :create, :destroy]
  end
end
