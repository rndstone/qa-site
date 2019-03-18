require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:category){Category.create(id:1, name: "日常生活")}
  let(:user){User.create(id:1, name:'test_user', email: "test@email.com", password:'testpassword')}
  
  it 'questioners cannot answer the question which they make' do
    question = FactoryBot.create(:question, user_id:user.id, category_id:category.id)
    # question = Question.new(id:1, title:'test', content:'test',user_id:user.id, category_id: category.id, is_open: 1)
    # question.save
    # answer = FactoryBot.create(:answer)
    answer = Answer.create(id:1, question_id:question.id, content: 'test', user_id: user.id, is_best_answer:0)
    answer.valid?
    expect(answer.errors[:answer]).to include "質問者は回答できません"
  end
  
  it "cannot answer the closed question" do
    user2 = User.create(id:2, name:'test_user2', email: "test2@email.com", password:'testpassword')
    question = FactoryBot.create(:question, user_id: user.id, category_id: category.id, is_open:0)
    answer = Answer.create(question_id:question.id, content: 'test', user_id: user2.id, is_best_answer:0)
    expect(answer.errors[:answer]).to include "close済みの質問には回答できません"
  end
end
