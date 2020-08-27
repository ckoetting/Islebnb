Rails.application.routes.draw do
  devise_for :users
  root to: 'listings#index'
  resources :listings do
    resources :reviews
    resources :bookings
  end
  get 'listings/:id/destroy', to: 'listings#destroy', as: :listing_destroy
  get 'users/my_booking_requests', to: 'users#my_booking_requests', as: :my_booking_requests
  get 'users/my_bookings', to: 'users#my_bookings', as: :my_bookings
  get 'users/my_booking_requests/:id/change_status', to: 'bookings#change_status', as: :change_status
  resources :users, only: [:show]
end