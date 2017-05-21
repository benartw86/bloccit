class User < ActiveRecord::Base
    
    has_many :posts
    
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
    
    enum role: [:member, :admin, :moderator]
end
