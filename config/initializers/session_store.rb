if  Rails.env == "production"
    Rails.application.config.session_store :cookie_store, key: '_authentication_app', domain:'http://authentication-my-app-for-production.herokuapp.com'
else 
    Rails.application.config.session_store :cookie_store, key: '_authentication_app'
end

#MAIN NAMING CONVENTION.
#DOMAIN = STRING AND WHATEVER
#THE DOMAIN NAME IS WHERE THE APP WILL BE HOSTED.
