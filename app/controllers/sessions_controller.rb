class SessionsController < ApplicationController # and it will run the CREATE method  #This will make a post request whenever the front-end hits the API
  include CurrentUserConcern #Imports our user concern controller class so that we can use it inthe logged_in method

  #User Model is called, we want to find by email, the front end uses params to wrap up user object
  # and then the .try authenticate is directly built into the system and it knows becuase we used has_secure_password
  #this allows us to use the authenticate method built in for us by rails.

  #create method first looks for user in database and then it will authenticate the password
  #and if it works it will store it in the user variable.

  #Simply put this is checking your credentials and assining you a unique cookie if you log in

  def create
    user =
      User.find_by(email: params['user']['email']).try(
        :authenticate,
        params['user']['password']
      )

    #Then if the user was created then we will communicate with the session
    # and we will set the user id = to the user id we just found.
    #We want to make sure they have a cookie on their system.
    #and it goes encrpyted into the user device.

    #Simply put this will make sure the session that was just created is equal to the cookie on your system.

    if user
      session[:user_id] = user.id
      render json: { status: :created, logged_in: true, user: user }
    else
      render json: { status: 401 }
    end
  end

  def logged_in
    #This method checks to see if a current user is available.
    #We added a concern inside of the concerns folder.
    
    
    #If they are logged in and their in a valid session_id, 
    #we can say they are logged and and return their user account
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      } #No HTTP status request needed Since this is a get request and we're not creating or editing only asking a question
    else 
      render json: {
        logged_in: false,
      }
    end
  end

  #API can send this response back and the front-end can 
  #say okay we are sure they are logged out on front end portion of app and this checks and verifys that.
  def logout
    reset_session
    render json: { status: 200, logged_out: true}
end 
end
