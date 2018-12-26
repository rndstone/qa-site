require 'rails_helper'

RSpec.feature "Users", type: :feature do
  let(:user){FactoryBot.create(:user)}
  
  describe "ログイン機能" do
    it "valid user" do
      expect(user).to be_valid
    end
    it "fails not registerd user auth" do
      # user = 
      visit root_path
      click_link "Login"
      
      fill_in "Email", with: "test"
      fill_in "Password", with: "test@testmail.com"
      click_button "Log in"
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
end
