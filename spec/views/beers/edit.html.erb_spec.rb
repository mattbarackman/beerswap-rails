require 'spec_helper'

describe "beers/edit" do
  before(:each) do
    @beer = assign(:beer, stub_model(Beer,
      :style => "MyString",
      :abv => "MyString",
      :bascore => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit beer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => beers_path(@beer), :method => "post" do
      assert_select "input#beer_style", :name => "beer[style]"
      assert_select "input#beer_abv", :name => "beer[abv]"
      assert_select "input#beer_bascore", :name => "beer[bascore]"
      assert_select "input#beer_name", :name => "beer[name]"
    end
  end
end
