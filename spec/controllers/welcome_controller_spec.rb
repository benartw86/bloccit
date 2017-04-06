require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do      #describe the subject of the spec
    
    describe "GET index" do
      it "renders the index template" do        
        
        get :index          #use get to call index method of WelcomeController

        expect(response).to render_template("index")        #we expect the controllers reponse to render the index template
    end
  end
  
    describe "GET about" do
      it "renders the about template" do
          
        get :about
        
        expect(response).to render_template("about")
    end
  end
  
    describe "GET faq" do
      it "renders the faq template" do
        
        get :faq
        
        expect(response).to render_template("faq")
    end 
  end 
end
