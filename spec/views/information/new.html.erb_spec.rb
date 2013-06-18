require 'spec_helper'

describe "information/new" do
  before(:each) do
    assign(:information, stub_model(Information,
      :info => "MyString"
    ).as_new_record)
  end

  it "renders new information form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", information_index_path, "post" do
      assert_select "input#information_info[name=?]", "information[info]"
    end
  end
end
