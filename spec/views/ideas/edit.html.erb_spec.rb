require 'rails_helper'

RSpec.describe "ideas/edit", type: :view do
  before(:each) do
    @idea = assign(:idea, Idea.create!(
      title: "MyText",
      outline: "MyText",
      detail: "MyText",
      user: nil
    ))
  end

  it "renders the edit idea form" do
    render

    assert_select "form[action=?][method=?]", idea_path(@idea), "post" do

      assert_select "textarea[name=?]", "idea[title]"

      assert_select "textarea[name=?]", "idea[outline]"

      assert_select "textarea[name=?]", "idea[detail]"

      assert_select "input[name=?]", "idea[user_id]"
    end
  end
end
