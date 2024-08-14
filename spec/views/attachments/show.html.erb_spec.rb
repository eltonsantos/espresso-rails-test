require 'rails_helper'

RSpec.describe "attachments/show", type: :view do
  before(:each) do
    @attachment = assign(:attachment, Attachment.create!(
      file: "",
      statement: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
