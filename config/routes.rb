Rails.application.routes.draw do
  #Ability to log in
  resources :sessions, only: %i[create]

  #Ability to create accounts
  resources :registrations, only: %i[create]

  
  #Add Delete route to Session Controller
  delete :logout, to: "sessions#logout"
  
  #Add Log in route to Session Controller
  get :logged_in to: "sessions#logged_in"

  #Home Page
  root to: 'static#home'
end
