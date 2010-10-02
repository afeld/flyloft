require 'spec_helper'

describe "orgs/show.html.haml" do
  before(:each) do
    @org = assign(:org, stub_model(Org,
      :name => "Name",
      :phone => "Phone",
      :street => "Street",
      :city => "City",
      :state => "State",
      :zip => 1,
      :country => "Country",
      :mission => "MyText",
      :contact_person => 1,
      :founding_year => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Phone".to_s)
    rendered.should contain("Street".to_s)
    rendered.should contain("City".to_s)
    rendered.should contain("State".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("Country".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
  end
end
