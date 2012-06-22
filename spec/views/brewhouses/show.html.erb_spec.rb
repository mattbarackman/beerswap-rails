require 'spec_helper'

describe "brewhouses/show" do
  before(:each) do
    @brewhouse = assign(:brewhouse, stub_model(Brewhouse,
      :zipcode => "Zipcode",
      :name => "Name",
      :activebeers => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zipcode/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
