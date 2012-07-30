require 'spec_helper'

describe "objectives/index" do
  before(:each) do
    assign(:objectives, [
      stub_model(Objective),
      stub_model(Objective)
    ])
  end

  it "renders a list of objectives" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
