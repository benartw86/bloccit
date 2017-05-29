class FavoriteMailer < ApplicationMailer
  default from: "masinfa@gmail.com"
  
  def new_comment(user, post, comment)
 
 # #18
    headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
    @user = user
    @post = post
    @comment = comment
 
 # #19
    mail(to: user.email, subject: "New comment on #{post.title}")
  end
  
  def new_post(post)  #why just a post and not a user as well?
    
    headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
    headers["References"] = "<post/#{post.id}@your-app-name.example>"
 
    #define instance variables available in the view below, which is the content sent in the email in this context
 
    @post = post

    mail(to: post.user.email, subject: "New post created and favorited, #{post.title}")
  end
end
