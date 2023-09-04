Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  
  # get 'events/index'
  resources :events, only: [:index, :new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
