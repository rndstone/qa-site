require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:user){FactoryBot.create(:user)}
  # let(:category){FactoryBot.create(:category)}
  # let(:question){FactoryBot.create(:question, user_id:user.id, category_id:category.id)}
  # let!(:question){FactoryBot.create(:question)}
  # let(:question2){FactoryBot.create(:question, title:'aaaa',user_id:user.id, category_id:category.id)}
  # scenario "ログイン機能" do
    it "valid user" do
      # p Question.find(1)
      expect(user).to be_valid
    end
    
    it "fails not registerd user auth" do
      # user = 
      visit root_path
      click_link "Login"
      
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
      # save_and_open_page
      expect(page).to have_content "新しい質問"
    end
    
    it "success user auth" do
      user = FactoryBot.create(:user)
      visit root_path
      click_link "Login"
      
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"
      expect(page).to have_content "新しい質問"
    end
  end
# end
