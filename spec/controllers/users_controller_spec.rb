require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "show" do
    before do
      @user = FactoryBot.build(:user)
      # @user2 = FactoryBot.build(:user, id:2, password: "anotherpassword")
      # puts @user.id
    end
    
    it "responds unsuccessfully if not logged_in" do
      # sign_in @user
      get :show, params: {id: @user.id}
      p response
      expect(response).to_not be_success
    end
    
    it "redirect to root_url if another user open user page" do
      sign_in @user
      get :show, params: {id: @user.id}
      # expect(response).to have_http_status "302"
      expect(response).to be_success
    end
    
    it "returns a 302 response" do
      get :show, params: {id: 1}
      expect(response).to have_http_status "302"
    end
  end
end
