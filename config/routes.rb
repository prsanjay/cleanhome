Rails.application.routes.draw do
  root 'customers#new'

  resources :bookings
  resources :cleaners
  resources :customers
end
