require 'spec_helper'

describe "information/index" do
  before(:each) do
    assign(:information, [
      stub_model(Information,
        :info => "Info"
      ),
      stub_model(Information,
        :info => "Info"
      )
    ])
  end

  it "renders a list of information" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Info".to_s, :count => 2
  end
end
