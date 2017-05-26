  class Post < ActiveRecord::Base
    
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy          #has_many method allows a post instance to have many comments related to it, allows allows retrieval of comments from a post
    has_many :votes, dependent: :destroy            #add votes association to posts, allowing us to call post.votes
    
    
    after_create :create_vote
    
    default_scope { order('rank DESC') }      # this method will order all posts by created_at date in descending order (DESC)

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
    
    
    def up_votes
 # #9
      votes.where(value: 1).count
    end
 
    def down_votes
 # #10
      votes.where(value: -1).count
    end
 
    def points
 # #11
      votes.sum(:value)
    end
    
    def update_rank
      age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
      new_rank = points + age_in_days
      update_attribute(:rank, new_rank)
    end
    
    private
    
    def create_vote
      user.votes.create(value: 1, post: self)
    end
  end


#Comments are dependent on a post's existence because of the has_many :comments declaration in Post. 
#When we delete a post, we also need to delete all related comments. 
#We'll perform a "cascade delete", which ensures that when a post is deleted, all of its comments are too. 