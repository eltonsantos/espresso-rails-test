require 'rails_helper'

RSpec.describe "statements/new", type: :view do
  before(:each) do
    assign(:statement, Statement.new(
      cost: "",
      merchant: "MyString",
      transaction_id: "",
      category: nil
    ))
  end

  it "renders new statement form" do
    render

    assert_select "form[action=?][method=?]", statements_path, "post" do

      assert_select "input[name=?]", "statement[cost]"

      assert_select "input[name=?]", "statement[merchant]"

      assert_select "input[name=?]", "statement[transaction_id]"

      assert_select "input[name=?]", "statement[category_id]"
    end
  end
end
