require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }   #using let, create new instance of Post class, naming it post.  Let defines a method
                                                                                #and upon first call in the spec (the it block) computes and stores the returned value
  
  describe "attributes" do                                                      #test whether post has attributes "title" and "body", tests whether post returns non-nil value for post.title and post.body calls
    it "has title and body attributes" do
      expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
    end
  end
end


