require 'rails_helper'

RSpec.describe "statements/show", type: :view do
  before(:each) do
    @statement = assign(:statement, Statement.create!(
      cost: "",
      merchant: "Merchant",
      transaction_id: "",
      category: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Merchant/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
