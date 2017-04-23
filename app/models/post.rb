class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy          #has_many method allows a post instance to have many comments related to it, allows allows retrieval of comments from a post
end


#Comments are dependent on a post's existence because of the has_many :comments declaration in Post. 
#When we delete a post, we also need to delete all related comments. 
#We'll perform a "cascade delete", which ensures that when a post is deleted, all of its comments are too. 