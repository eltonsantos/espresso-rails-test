require 'rails_helper'

RSpec.describe "attachments/edit", type: :view do
  before(:each) do
    @attachment = assign(:attachment, Attachment.create!(
      file: "",
      statement: nil
    ))
  end

  it "renders the edit attachment form" do
    render

    assert_select "form[action=?][method=?]", attachment_path(@attachment), "post" do

      assert_select "input[name=?]", "attachment[file]"

      assert_select "input[name=?]", "attachment[statement_id]"
    end
  end
end
