require 'rails_helper'

RSpec.describe "attachments/new", type: :view do
  before(:each) do
    assign(:attachment, Attachment.new(
      file: "",
      statement: nil
    ))
  end

  it "renders new attachment form" do
    render

    assert_select "form[action=?][method=?]", attachments_path, "post" do

      assert_select "input[name=?]", "attachment[file]"

      assert_select "input[name=?]", "attachment[statement_id]"
    end
  end
end
