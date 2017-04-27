require 'rails_helper'

RSpec.describe Question, type: :model do

  let(:question) {Question.create!}

  describe "attributes" do 
    it "includes a title" do
      expect(question).to respond_to(:title)
    end
  
    it "includes a body" do
      expect(question).to respond_to(:body)
    end
  
    it "includes resolved" do
      expect(question).to respond_to(:resolved)
    end
  end 
end