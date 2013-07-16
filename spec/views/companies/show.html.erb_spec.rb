require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :schema_code => 1,
      :domain_id => "Domain",
      :name => "Name",
      :code => "Code",
      :status_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Domain/)
    rendered.should match(/Name/)
    rendered.should match(/Code/)
    rendered.should match(/2/)
  end
end
