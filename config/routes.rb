Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions',
    passwords: 'admin_users/passwords'
  }

  root 'home#index'
  
  resources :events, only: %i[index show]
  resources :bookings, only: %i[create] do
    get :booking_details, on: :member
  end

  resources :refunds

  namespace :admin do
    get 'dashboard' => 'dashboard#index'
  end
end
