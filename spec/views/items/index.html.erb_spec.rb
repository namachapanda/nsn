require 'spec_helper'

describe "items/index" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :no => 1,
        :name => "Name",
        :price => "9.99",
        :category_id => 2,
        :color_id => 3,
        :img => "Img",
        :explain => "MyText"
      ),
      stub_model(Item,
        :no => 1,
        :name => "Name",
        :price => "9.99",
        :category_id => 2,
        :color_id => 3,
        :img => "Img",
        :explain => "MyText"
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Img".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
