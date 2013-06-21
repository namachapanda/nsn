require 'spec_helper'

describe "manage/items/edit" do
  before(:each) do
    @manage_item = assign(:manage_item, stub_model(Manage::Item,
      :no => 1
    ))
  end

  it "renders the edit manage_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", manage_item_path(@manage_item), "post" do
      assert_select "input#manage_item_no[name=?]", "manage_item[no]"
    end
  end
end
