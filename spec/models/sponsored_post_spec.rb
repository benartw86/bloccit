require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
    
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }    
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) { 0 }
  
  let(:topic) { Topic.create!(name: name, description: description) }
  
  let(:sponsoredpost) { topic.sponsored_posts.create!(title: title, body: body, price: 0) }

 # #1
   describe "attributes" do
     it "has title, body and integer attributes" do
       expect(sponsoredpost).to have_attributes(title: title, body: body, price: 0)
     end
   end
end
