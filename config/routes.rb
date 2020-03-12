Rails.application.routes.draw do
  resources :sessions, only: %i[create]
  resources :registrations, only: %i[create]

  root to: 'static#home'
end
