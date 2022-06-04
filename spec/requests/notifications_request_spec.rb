require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  let(:user) { create(:user) }
  
  describe "GET /notifications" do
    context "user is authenticated" do
      before do
        sign_in user
      end
      it "returns http success" do
        get '/notifications'
        expect(response).to have_http_status(:success)
      end
    end
    context "user is not authenticated" do
      it "redirect to sign in page" do
        get '/notifications'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(:new_user_session)
      end
    end
  end
end
