require 'spec_helper'

describe "beers/index" do
  before(:each) do
    assign(:beers, [
      stub_model(Beer,
        :style => "Style",
        :abv => "Abv",
        :bascore => 1,
        :name => "Name"
      ),
      stub_model(Beer,
        :style => "Style",
        :abv => "Abv",
        :bascore => 1,
        :name => "Name"
      )
    ])
  end

  it "renders a list of beers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Style".to_s, :count => 2
    assert_select "tr>td", :text => "Abv".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
