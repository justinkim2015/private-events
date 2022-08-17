Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "events#index"

  resources :events, :users, :event_attendees
  
  # post "/event_attendees/new", to: "event_attendees#create"
  # Defines the root path route ("/")
  # root "articles#index"
end
