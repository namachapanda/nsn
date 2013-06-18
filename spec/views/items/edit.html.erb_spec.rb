require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :no => 1,
      :name => "MyString",
      :price => "9.99",
      :category_id => 1,
      :color_id => 1,
      :img => "MyString",
      :explain => "MyText"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_path(@item), "post" do
      assert_select "input#item_no[name=?]", "item[no]"
      assert_select "input#item_name[name=?]", "item[name]"
      assert_select "input#item_price[name=?]", "item[price]"
      assert_select "input#item_category_id[name=?]", "item[category_id]"
      assert_select "input#item_color_id[name=?]", "item[color_id]"
      assert_select "input#item_img[name=?]", "item[img]"
      assert_select "textarea#item_explain[name=?]", "item[explain]"
    end
  end
end
