require 'spec_helper'

describe "objectives/show" do
  before(:each) do
    @objective = assign(:objective, stub_model(Objective))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
