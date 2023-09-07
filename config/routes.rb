Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  
  # get 'events/index'
  resources :events, only: [:index, :show, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # resources :event_users, only: [:create]
  get 'event_users/attend_event'

  # Defines the root path route ("/")
  root "events#index"
end
