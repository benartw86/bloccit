module SessionsHelper
    
  def create_session(user)
    session[:user_id] = user.id
  end
  
  def destroy_session(user)
    session[:user_id] = nil
  end
  
  def current_user
    User.find_by(id: session[:user_id])
  end
end


#current_user finds the signed-in user by taking the user id from the session and searching the database for the user in question. 
#When the user closes Bloccit, the related session object will be destroyed. 
#Because our session only stores the user id, we need to retrieve the  User instance, and all of its properties, 
#by searching the database for the record with the corresponding user id.

