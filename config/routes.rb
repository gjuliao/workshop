Rails.application.routes.draw do
  root 'home#index'
  
  resources :events, only: %i[index show]
end
