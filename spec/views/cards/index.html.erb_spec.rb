require 'rails_helper'

RSpec.describe "cards/index", type: :view do
  before(:each) do
    assign(:cards, [
      Card.create!(
        last4: "Last4",
        user: nil
      ),
      Card.create!(
        last4: "Last4",
        user: nil
      )
    ])
  end

  it "renders a list of cards" do
    render
    assert_select "tr>td", text: "Last4".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
