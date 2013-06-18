require 'spec_helper'

describe "items/show" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :no => 1,
      :name => "Name",
      :price => "9.99",
      :category_id => 2,
      :color_id => 3,
      :img => "Img",
      :explain => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/9.99/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Img/)
    rendered.should match(/MyText/)
  end
end
