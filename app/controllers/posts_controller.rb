class PostsController < ApplicationController
  
  before_action :require_sign_in, except: :show  #use a before_action filter to call require_sign_in before each of our controller actions, except show

  before_action :authorize_user, except: [:show, :new, :create]

  def show
    
    @post = Post.find(params[:id]) # we find the post that corresponds to the id in the params that was passed to  show and assign it to @post. Unlike in the index method, in the show method, we populate an instance variable with a single post, rather than a collection of posts
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new  #we create an instance variable, then assign it an empty post returned by Post.new (not saved)  
  end
  
  def create    #create is a POST action that works behind the scenes to collect the data submitted by users, does not have a corresponding view
    
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)  
    @post.user = current_user
  
    if @post.save
    
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]   #redirecting to @post will direct the user to the posts show view, the flash action provides a way to pass temp values between actions
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
    @post.assign_attributes(post_params)
    
    if @post.save
       flash[:notice] = "Post was updated."
       redirect_to [@post.topic, @post]
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to @post.topic
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
  
  def authorize_user
    post = Post.find(params[:id])
    
    unless current_user == post.user || current_user.admin? || current_user.moderator?
      flash[:alert] = "You must be an admin to do that."
      redirect_to [post.topic, post]
    end
  end
end
