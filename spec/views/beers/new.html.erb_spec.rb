require 'spec_helper'

describe "beers/new" do
  before(:each) do
    assign(:beer, stub_model(Beer,
      :style => "MyString",
      :abv => "MyString",
      :bascore => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new beer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => beers_path, :method => "post" do
      assert_select "input#beer_style", :name => "beer[style]"
      assert_select "input#beer_abv", :name => "beer[abv]"
      assert_select "input#beer_bascore", :name => "beer[bascore]"
      assert_select "input#beer_name", :name => "beer[name]"
    end
  end
end
