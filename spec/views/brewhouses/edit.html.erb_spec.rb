require 'spec_helper'

describe "brewhouses/edit" do
  before(:each) do
    @brewhouse = assign(:brewhouse, stub_model(Brewhouse,
      :zipcode => "MyString",
      :name => "MyString",
      :activebeers => 1
    ))
  end

  it "renders the edit brewhouse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => brewhouses_path(@brewhouse), :method => "post" do
      assert_select "input#brewhouse_zipcode", :name => "brewhouse[zipcode]"
      assert_select "input#brewhouse_name", :name => "brewhouse[name]"
      assert_select "input#brewhouse_activebeers", :name => "brewhouse[activebeers]"
    end
  end
end
