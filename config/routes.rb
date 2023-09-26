Rails.application.routes.draw do
  devise_for :admin_users
  root 'home#index'
  
  resources :events, only: %i[index show]
  resources :bookings, only: %i[create] do
    get :booking_details, on: :member
  end
end
