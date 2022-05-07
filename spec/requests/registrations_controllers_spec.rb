require 'rails_helper'

RSpec.describe "Registrations", type: :request do

  describe "POST /users" do
    subject { post user_registration_path, params: { user: params } }
    let(:params) { attributes_for(:user) }

    it do
      expect { subject }.to change(User, :count).by(1)
      expect(response).to have_http_status("302")
    end

    context "when invalid" do
      let(:params) { attributes_for(:user, password: '') }
      it do
        expect { subject }.not_to change(User, :count)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
