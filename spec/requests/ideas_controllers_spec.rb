require 'rails_helper'

RSpec.describe "Ideas", type: :request do
  let(:user) { create(:user) }

  describe "GET ideas/register" do
    context "user is authenticated" do
      before do
        sign_in user
      end
      it "renders a successful response" do
        get '/ideas/register'
        expect(response).to have_http_status(200)
        expect(response).to be_successful
      end
    end
    context "user is not authenticated" do
      it "redirect to sign in page" do
        get '/ideas/register'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(:new_user_session)
      end
    end
  end

  describe "POST /ideas/register" do
    subject { post '/ideas/register', params: params}
    let(:idea) { build(:idea, title: title, outline: outline, detail: detail, user: user) }
    let(:params) { { idea: attributes_for(:idea)} }
    context "user is authenticated" do
      let(:idea) {build(:idea)}
      before do
        sign_in user
      end
      it "normal" do
        subject
        expect(response).to have_http_status(302)
        idea_created = Idea.where(user: user.id).first
        expect(idea_created.title).to eq idea.title
        expect(idea_created.outline).to eq idea.outline
        expect(idea_created.detail).to eq idea.detail
        expect(response).to redirect_to idea_url(idea_created.id)
      end
    end
    context "user is not authenticated" do
      it "redirect to sign in page" do
        post '/ideas/register'
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(:new_user_session)
      end
    end
  end
end
