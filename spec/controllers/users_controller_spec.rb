require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "index" do
    before do
      @user = FactoryBot.create(:user)
    end
    
    it "responds not successfully if not logged_in" do
      sign_in @user
      get :show, params: {id: 1}
      expect(response).to_not be_success
    end
    
    it "returns a 302 response" do
      get :show, params: {id: 1}
      expect(response).to have_http_status "302"
    end
  end
end
