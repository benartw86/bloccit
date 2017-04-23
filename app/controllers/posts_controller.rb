class PostsController < ApplicationController
  def index
    @posts = Post.all  #we declare an instance variable @posts and assign it a collection of Post objects using the all method provided by ActiveRecord. all returns a collection of  Post objects.
  end

  def show
    
    @post = Post.find(params[:id]) # we find the post that corresponds to the id in the params that was passed to  show and assign it to @post. Unlike in the index method, in the show method, we populate an instance variable with a single post, rather than a collection of posts
  end

  def new
    @post = Post.new  #we create an instance variable, then assign it an empty post returned by Post.new (not saved)  
  end
  
  def create    #create is a POST action that works behind the scenes to collect the data submitted by users, does not have a corresponding view

    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
  
    if @post.save
    
      flash[:notice] = "Post was saved."
      redirect_to @post   #redirecting to @post will direct the user to the posts show view, the flash action provides a way to pass temp values between actions
    else
    
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new     #render new view if Post save is unsuccessful
    end
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
    if @post.save
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to posts_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
    end
  end
end
