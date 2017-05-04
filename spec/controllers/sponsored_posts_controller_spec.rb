require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 0) }

  describe "GET #show" do
    it "returns http success" do 
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the show view" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id 
      expect(response).to render_template :show
    end
  
    it "assigns my_sponsored_post to @sponsored_post"
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      
      expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end
    
    it "initializes @sponsored_post"
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to_be_nil
    end
    
    describe "POST create" do
      it "increases the number of sponsored posts by 1"
        expect { post :create, topic_id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 0}}.to change(SponsoredPost,:count).by(1)
      end  
      
      it "assigns new sponsored post to @sponsored_post" do
        post :create, topic_id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 0}
      end
      
      it "redirects to the new sponsored post" do
        post :create, topic_id, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 0}
        expect(response).to redirect_to [my_topic, SponsoredPost.last]
      end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    
    it "renders the edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :edit
    end
    
    it "assigns sponsored_post to be updated to @sponsored_post" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      
      sponsored_post_instance = assigns(:sponsored_post)
      
      expect(sponsored_post_instance.id).to eq my_sponsored_post.id
      expect(sponsored_post_instance.title).to eq my_sponsored_post.title
      expect(sponsored_post_instance.body).to eq my_sponsored_post.body
    end
    
  describe "PUT update" do
    it "Updates the sponsored post with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = 0
        
      put :update, topic_id: my_topic.id, id: my_sponsored_post.id, post: {title: new_title, body: new_body, price: new_price}
        
      updated_sponsored_post = assigns(:sponsored_post)
      expect(updated_post.id).to eq my_post.id
      expect(updated_post.title).to eq new_title
      expect(updated_sponsored_post.body).to eq new_body
      expect(updated_sponsored_post.price).to eq new_price
        
    it "redirects to the updated sponsored post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = 0
          
      put :update, topic_id: my_topic.id, id: my_sponsored_post.id, post: {title: new_title, body: new_body, price: new_price}
          
       expect(response).to redirect_to [my_topic, my_sponsored_post]
    end
  end
end
