require 'spec_helper'

describe "manage/items/new" do
  before(:each) do
    assign(:manage_item, stub_model(Manage::Item,
      :no => 1
    ).as_new_record)
  end

  it "renders new manage_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", manage_items_path, "post" do
      assert_select "input#manage_item_no[name=?]", "manage_item[no]"
    end
  end
end
