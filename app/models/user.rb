class User < ActiveRecord::Base
    
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
      #we register an inline callback directly after the before_save callback
    before_save { self.email = email.downcase if email.present? }
    before_save { self.role ||= :member }
    
    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
    
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"  
    #first validation executes this to ensure that when we create a new user, they have a valid password
    validates :password, length: { minimum: 6 }, allow_blank: true
    
    validates :email,
              presence: true,
              uniqueness: { case_sensitive: false }, 
              length: { minimum: 3, maximum: 254 }
              
    has_secure_password
    
    enum role: [:member, :admin]
    
    #this method takes a post object and uses where to retrieve the user's favorites with a post_id that matches post_id
    #If the user has favorited a post it will return an array of one item, if not, empty array, calling first returns the favorite or nil(empty)
    
    def favorite_for(post)
      favorites.where(post_id: post.id).first
    end
end
