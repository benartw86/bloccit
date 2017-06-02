

  module UsersHelper
    def has_posts? user
      user.posts.count > 0 ? "#{user.name}" : "#{user.name} has no posts"      
    end 
  end


#Create a helper method that detects if there are posts or comments for a given user. 
#Use the helper method to display a message instead of the <h2> if no posts or comments exist. 
#Something simple like "{user.name} has not submitted any posts yet."