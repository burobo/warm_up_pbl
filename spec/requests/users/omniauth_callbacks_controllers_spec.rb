require 'rails_helper'

RSpec.describe "Users::OmniauthCallbacksControllers", type: :request do

  describe "sns authentication" do
    context "when google login" do
      before do
        OmniAuth.config.mock_auth[:google_oauth2] = nil
        Rails.application.env_config['omniauth.auth'] = set_omniauth
      end
      let(:path) { post '/users/auth/google_oauth2/callback' }

      it do
        expect { path }.to change(User, :count).by(1)
        expect(response).to redirect_to root_url
      end
    end

    context "when facebook login" do
      before do
        OmniAuth.config.mock_auth[:facebook] = nil
        Rails.application.env_config['omniauth.auth'] = set_omniauth :facebook
      end
      let(:path) { post '/users/auth/facebook/callback' }

      it do
        expect { path }.to change(User, :count).by(1)
        expect(response).to redirect_to root_url
      end
    end
  end
end
