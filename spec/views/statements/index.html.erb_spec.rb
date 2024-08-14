require 'rails_helper'

RSpec.describe "statements/index", type: :view do
  before(:each) do
    assign(:statements, [
      Statement.create!(
        cost: "",
        merchant: "Merchant",
        transaction_id: "",
        category: nil
      ),
      Statement.create!(
        cost: "",
        merchant: "Merchant",
        transaction_id: "",
        category: nil
      )
    ])
  end

  it "renders a list of statements" do
    render
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "Merchant".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
