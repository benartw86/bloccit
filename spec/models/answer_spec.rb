require 'rails_helper'

RSpec.describe Answer, type: :model do
    
  let(:question) {Question.create!(title: "New Question Title", body: "New Question Body", resolved: false) }
  let(:answer) {Answer.create!(body: "Answer Body", question: question) }
  
  describe "attributes" do
    it "has a body attribute" do
      expect(question).to have_attributes(body: "New Question Body")
      
    it "should respond to body" do
      expect(answer).to respond_to(:body)  #want the body text to answer the question
    end
  end
end
