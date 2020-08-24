Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings do
    resources :reviews
    resources :bookings
  end
  resources :users
end