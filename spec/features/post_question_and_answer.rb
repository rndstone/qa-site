require 'rails_helper'

RSpec.feature "post a question and an answer", type: :feature do
  # let!(:category){FactoryBot.create(:category)}
  let!(:question){FactoryBot.create(:question)}
  # let!(:user){FactoryBot.create(:user)}
  scenario "user post a new question" do
    
    visit root_path
    click_link "Login"
    p Question.find(1)
    p Category.all
    fill_in "Email", with: question.user.email
    fill_in "Password", with: question.user.password
    click_button "Log in"
    
    click_link "質問する"
    fill_in "Title", with: "Test post"
    fill_in "Content", with: "This is test question"
    select "日常生活", from: "question_category_id"
    click_button "投稿する"
    expect(page).to have_content "質問を投稿しました"
    
  end
  
  scenario "user post an answer" do
    visit root_path
    answer_user = FactoryBot.create(:user2)
    click_link "Login"
    p answer_user
    fill_in "Email", with: answer_user.email
    fill_in "Password", with: answer_user.password
    click_button "Log in"
    
    expect(page).to have_content question.title
    
    click_link question.title
    expect(page).to have_content question.content
    fill_in "answer_content", with: "this is the answer"
    click_button "回答する"
    expect(page).to have_content " 回答を送信しました"
  end
end