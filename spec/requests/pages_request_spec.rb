require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/pages/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /detail" do
    it "returns http success" do
      get "/pages/detail"
      expect(response).to have_http_status(:success)
    end
  end

end
