require 'spec_helper'

describe "brewhouses/index" do
  before(:each) do
    assign(:brewhouses, [
      stub_model(Brewhouse,
        :zipcode => "Zipcode",
        :name => "Name",
        :activebeers => 1
      ),
      stub_model(Brewhouse,
        :zipcode => "Zipcode",
        :name => "Name",
        :activebeers => 1
      )
    ])
  end

  it "renders a list of brewhouses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
