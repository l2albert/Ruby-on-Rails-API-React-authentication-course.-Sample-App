module CurrentUserConcern
    extend ActiveSupport::Concern

    #Sets a before action to the set current user method
    included do
        before_action :set_current_user
    end

    #Checks to see if any user is logged in our not.
    def set_current_user
        #Do we have a user_id in sessions? Yes? 
        #then Now we can use this to query the user, set the instance variable 
        #and now any method in our application just has to check if we have a current_user without checking tokens etc
        
        if session[:user_id]
            @current_user = User.find(session[:user_id])
        end
    end
end 