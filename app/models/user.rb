class User < ApplicationRecord 
  #Has secure password method tells user
  #model that the password digest field needs to be encrypted  
  has_secure_password

  #checks for presnce of email
  #and if there is more than 1 of the same

  validates_presence_of :email
  validates_uniqueness_of :email
end
