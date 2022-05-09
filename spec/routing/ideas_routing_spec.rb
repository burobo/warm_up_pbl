require "rails_helper"

RSpec.describe IdeasController, type: :routing do
  describe "routing" do
    it "routes to #register" do
      expect(get: "/ideas/register").to route_to("ideas#register")
    end
    it "routes to #create" do
      expect(post: "/ideas/register").to route_to("ideas#create")
    end
    it "routes to #show" do
      expect(get: "/ideas/1").to route_to("ideas#show", id: "1")
    end
  end
end
