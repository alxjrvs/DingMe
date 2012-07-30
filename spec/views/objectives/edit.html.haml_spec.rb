require 'spec_helper'

describe "objectives/edit" do
  before(:each) do
    @objective = assign(:objective, stub_model(Objective))
  end

  it "renders the edit objective form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => objectives_path(@objective), :method => "post" do
    end
  end
end
