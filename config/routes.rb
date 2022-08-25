Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root "events#index"

  resources :events, :users, :event_attendees, :invites

  post '/invites/:id', to: 'invites#accept'
end
