require 'rails_helper'

RSpec.describe "Ideas", type: :request do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

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
        idea_created = Idea.where(user: user.id).last
        expect(idea_created.title).to eq idea.title
        expect(idea_created.outline).to eq idea.outline
        expect(idea_created.detail).to eq idea.detail
        expect(response).to redirect_to({controller: :ideas, action: :show, id: idea_created.id})
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

  describe "GET ideas/edit/:id" do
    subject { get "/ideas/edit/#{idea.id}", params: params}
    let(:idea) { create(:idea, title: title, outline: outline, detail: detail, user: user) }
    let(:params) { { idea: {id: idea.id} } }
    context "user is authenticated" do
      let(:idea) {create(:idea, user: user)}
      it "renders a successful response" do
        sign_in user
        subject
        expect(response).to have_http_status(200)
        expect(response).to be_successful
      end
      it  "edits a idea that is not mine" do
        sign_in user2
        subject
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(:ideas_show)
      end
    end
    context "user is not authenticated" do
      let(:idea) {create(:idea)}
      it "redirect to sign in page" do
        subject
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(:new_user_session)
      end
    end
  end

  describe "PUT /ideas/:id" do
    subject { put "/ideas/#{idea.id}", params: params}
    let(:idea) { create(:idea, title: title, outline: outline, detail: detail, user: user) }
    let(:params) { { idea: {id: idea.id, title: "updated_title", outline: "updated_outline", detail: "updated_detail"} } }
    context "user is authenticated" do
      let(:idea) { create(:idea, user: user) }
      it "normal" do
        sign_in user
        subject
        expect(response).to have_http_status(302)
        expect(response).to redirect_to ({controller: :ideas, action: :show, id: idea.id})
        idea_updated = Idea.find(idea.id)
        expect(idea_updated.title).to eq params[:idea][:title]
        expect(idea_updated.outline).to eq params[:idea][:outline]
        expect(idea_updated.detail).to eq params[:idea][:detail]
      end
      it "updates a idea that is not mine" do
        sign_in user2
        subject
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(:ideas_show)
        idea_not_updated = Idea.find(idea.id)
        expect(idea_not_updated.title).to_not eq params[:idea][:title]
        expect(idea_not_updated.outline).to_not eq params[:idea][:outline]
        expect(idea_not_updated.detail).to_not eq params[:idea][:detail]
      end
    end
    context "user is not authenticated" do
      let(:idea) { create(:idea, user: user) }
      it "redirect to sign in page" do
        subject
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(:new_user_session)
      end
    end
  end

  describe "PUT /ideas/:id/favorite" do
    subject { put "/ideas/#{idea.id}/favorite", params: params}
    let(:idea) { create(:idea, title: title, outline: outline, detail: detail, user: user) }
    let(:params) { { idea: {id: idea.id} } }
    context "user is authenticated" do
      let(:idea) { create(:idea, user: user) }
      it "normal" do
        sign_in user2
        subject
        expect(response).to have_http_status(302)
        favorite_created = Favorite.last
        notification_created = Notification.last
        expect(favorite_created.user_id).to eq user2.id
        expect(favorite_created.idea_id).to eq idea.id
        expect(notification_created.user_id).to eq idea.user.id
        expect(notification_created.favorite.idea_id).to eq idea.id
        expect(response).to redirect_to ({controller: :ideas, action: :show, id: idea.id})
      end
      it "favorites self idea" do
        sign_in user
        subject
        expect(response).to have_http_status(302)
        favorite_created = Favorite.last
        expect(favorite_created).to be nil
        expect(response).to redirect_to ({controller: :ideas, action: :show, id: idea.id})
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
end
