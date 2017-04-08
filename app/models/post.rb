class Post < ActiveRecord::Base
    has_may :comments           #has_many method allows a post instance to have many comments related to it, allows allows retrieval of comments from a post
end
