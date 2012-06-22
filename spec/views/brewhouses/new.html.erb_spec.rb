require 'spec_helper'

describe "brewhouses/new" do
  before(:each) do
    assign(:brewhouse, stub_model(Brewhouse,
      :zipcode => "MyString",
      :name => "MyString",
      :activebeers => 1
    ).as_new_record)
  end

  it "renders new brewhouse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => brewhouses_path, :method => "post" do
      assert_select "input#brewhouse_zipcode", :name => "brewhouse[zipcode]"
      assert_select "input#brewhouse_name", :name => "brewhouse[name]"
      assert_select "input#brewhouse_activebeers", :name => "brewhouse[activebeers]"
    end
  end
end
