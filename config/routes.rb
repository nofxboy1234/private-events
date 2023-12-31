Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  
  # get 'events/index'
  resources :events, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # resources :event_users, only: [:create]
  get 'event_users/attend_event'
  get 'event_users/unattend_event'
  get 'event_users/invite'

  # Defines the root path route ("/")
  root "events#index"
end
