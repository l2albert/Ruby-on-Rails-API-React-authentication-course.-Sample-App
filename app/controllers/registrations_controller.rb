class RegistrationsController < ApplicationController
  #This will create a new user and passes 3 values to it.
  #These values arw wrapped by the'user model and gets the nested value inside of the user model.

  def create
    user = User.create!(
        email: params['user']['email'],
        password: params['user']['password'],
        password_confirmation: params['user']['password_confirmation']
      )

    #If the new user cookie made is equal to the new user_id from the model made
    #then it will render a new user if not it will render an error.

    if user
      session[:user_id] = user.id
      render json: { status: :created, user: user }
    else
      render json: { status: 500 }
    end
  end
end
