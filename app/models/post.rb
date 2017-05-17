class Post < ActiveRecord::Base
    
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy          #has_many method allows a post instance to have many comments related to it, allows allows retrieval of comments from a post

    default_scope { order('created_at DESC') }      # this method will order all posts by created_at date in descending order (DESC)

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
end


#Comments are dependent on a post's existence because of the has_many :comments declaration in Post. 
#When we delete a post, we also need to delete all related comments. 
#We'll perform a "cascade delete", which ensures that when a post is deleted, all of its comments are too. 