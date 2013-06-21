require 'spec_helper'

describe "manage/items/show" do
  before(:each) do
    @manage_item = assign(:manage_item, stub_model(Manage::Item,
      :no => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
