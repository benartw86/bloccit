require 'rails_helper'

 RSpec.describe Post, type: :model do
   
   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:title) { RandomData.random_sentence }
   let(:body) { RandomData.random_paragraph }
 # #create a parent topic for post
   let(:topic) { Topic.create!(name: name, description: description) }
 # #associate post with topic via topic.posts.create!, this is a chained method, creating a post for a given topic
   let(:post) { topic.posts.create!(title: title, body: body) }
 
   it { is_expected.to belong_to(:topic) }

   describe "attributes" do
     it "has a title and body attribute" do
       expect(post).to have_attributes(title: title, body: body)
     end
   end
 end

 


#using let, create new instance of Post class, naming it post.  Let defines a method
#and upon first call in the spec (the it block) computes and stores the returned value
#test whether post has attributes "title" and "body", tests whether post returns non-nil value for post.title and post.body calls
