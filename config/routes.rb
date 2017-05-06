Rails.application.routes.draw do
  get 'admins/index'

  devise_for :admins
  root 'customers#new'

  resources :bookings
  resources :cleaners
  resources :customers
  resources :cities
end
