require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { create(:topic) }
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  
  #create comment with an associated user
  let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }
 
 # #2
     it { is_expected.to belong_to(:post) }
     it { is_expected.to belong_to(:user) }
 # #3
     it { is_expected.to validate_presence_of(:body) }
     it { is_expected.to validate_length_of(:body).is_at_least(5) }
    
  describe "attributes" do
    it "has a body attribute" do
      expect(comment). to have_attributes(body: "Comment Body")
    end
  end
  
  describe "after_create" do
 # #22
    before do
      @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
    end
 
 # #23
    it "sends an email to users who have favorited the post" do
      favorite = user.favorites.create(post: post)
      expect(FavoriteMailer).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))
 
      @another_comment.save!
    end
 
 # #24
    it "does not send emails to users who haven't favorited the post" do
      expect(FavoriteMailer).not_to receive(:new_comment)
 
      @another_comment.save!
    end
  end
end

#At #22, we initialize (but don't save) a new comment for post.

#23, we favorite post then expect FavoriteMailer will receive a call to new_comment. 
#We then save @another_comment to trigger the after create callback.

#24, test that FavoriteMailer does not receive a call to new_comment when post isn't favorited.
