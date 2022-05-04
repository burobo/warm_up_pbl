require 'rails_helper'

RSpec.describe "ideas/new", type: :view do
  before(:each) do
    assign(:idea, Idea.new(
      title: "MyText",
      outline: "MyText",
      detail: "MyText",
      user: nil
    ))
  end

  it "renders new idea form" do
    render

    assert_select "form[action=?][method=?]", ideas_path, "post" do

      assert_select "textarea[name=?]", "idea[title]"

      assert_select "textarea[name=?]", "idea[outline]"

      assert_select "textarea[name=?]", "idea[detail]"

      assert_select "input[name=?]", "idea[user_id]"
    end
  end
end
