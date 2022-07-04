require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:user) { create :user }

  describe 'POST /ideas/:ideas_show_id/comments' do
    before do
      sign_in user
    end
    subject { post ideas_show_comments_path(idea), params: params, headers: headers }
    let(:idea) { create :idea }
    let(:headers) { { HTTP_REFERER: ideas_show_url(idea) } }
    let(:params) do
      {
        comment: {
          content: 'hogehoge',
          idea_id: idea.id
        }
      }
    end
    context "when favorite idea is present" do
      let!(:favorite) { create :favorite, idea: idea, user: user }

      it do
        expect { subject }.to change(Comment, :count).by(1)
        expect(response).to redirect_to headers[:HTTP_REFERER]
      end
    end

    context "when favorite idea is blank" do

      it do
        expect { subject }.not_to change(Comment, :count)
        expect(response).to have_http_status(204)
      end
    end

    context "When originator makes comment" do
      let(:idea) { create :idea, user: user }

      it do
        expect { subject }.to change(Comment, :count).by(1)
        expect(response).to redirect_to headers[:HTTP_REFERER]
      end
    end
  end
end
