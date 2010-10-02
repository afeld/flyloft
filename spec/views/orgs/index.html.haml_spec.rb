require 'spec_helper'

describe "orgs/index.html.haml" do
  before(:each) do
    assign(:orgs, [
      stub_model(Org,
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
      ),
      stub_model(Org,
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
      )
    ])
  end

  it "renders a list of orgs" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Phone".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Street".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "City".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "State".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Country".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
