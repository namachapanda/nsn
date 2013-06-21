require 'spec_helper'

describe "manage/items/index" do
  before(:each) do
    assign(:manage_items, [
      stub_model(Manage::Item,
        :no => 1
      ),
      stub_model(Manage::Item,
        :no => 1
      )
    ])
  end

  it "renders a list of manage/items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
