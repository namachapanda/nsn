require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :schema_code => 1,
        :domain_id => "Domain",
        :name => "Name",
        :code => "Code",
        :status_id => 2
      ),
      stub_model(Company,
        :schema_code => 1,
        :domain_id => "Domain",
        :name => "Name",
        :code => "Code",
        :status_id => 2
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Domain".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
