require 'rails_helper'

RSpec.describe "statements/edit", type: :view do
  before(:each) do
    @statement = assign(:statement, Statement.create!(
      cost: "",
      merchant: "MyString",
      transaction_id: "",
      category: nil
    ))
  end

  it "renders the edit statement form" do
    render

    assert_select "form[action=?][method=?]", statement_path(@statement), "post" do

      assert_select "input[name=?]", "statement[cost]"

      assert_select "input[name=?]", "statement[merchant]"

      assert_select "input[name=?]", "statement[transaction_id]"

      assert_select "input[name=?]", "statement[category_id]"
    end
  end
end
