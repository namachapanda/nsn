require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :schema_code => 1,
      :domain_id => "MyString",
      :name => "MyString",
      :code => "MyString",
      :status_id => 1
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_path(@company), "post" do
      assert_select "input#company_schema_code[name=?]", "company[schema_code]"
      assert_select "input#company_domain_id[name=?]", "company[domain_id]"
      assert_select "input#company_name[name=?]", "company[name]"
      assert_select "input#company_code[name=?]", "company[code]"
      assert_select "input#company_status_id[name=?]", "company[status_id]"
    end
  end
end
