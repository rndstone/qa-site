require 'rails_helper'

RSpec.describe Question, type: :model do
  it "not existing user cannot make a question" do
    question = Question.new(id:1, title:'test', content:'test',user_id:1, category_id: 1, is_open: 1)
    question.valid?
  end
end
