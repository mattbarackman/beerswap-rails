require 'spec_helper'

describe "beers/show" do
  before(:each) do
    @beer = assign(:beer, stub_model(Beer,
      :style => "Style",
      :abv => "Abv",
      :bascore => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Style/)
    rendered.should match(/Abv/)
    rendered.should match(/1/)
    rendered.should match(/Name/)
  end
end
