require 'rails_helper'

RSpec.describe "ideas/index", type: :view do
  before(:each) do
    assign(:ideas, [
      Idea.create!(
        title: "MyText",
        outline: "MyText",
        detail: "MyText",
        user: nil
      ),
      Idea.create!(
        title: "MyText",
        outline: "MyText",
        detail: "MyText",
        user: nil
      )
    ])
  end

  it "renders a list of ideas" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
