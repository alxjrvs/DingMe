require 'spec_helper'

describe "quests/show" do
  before(:each) do
    @quest = assign(:quest, stub_model(Quest))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
