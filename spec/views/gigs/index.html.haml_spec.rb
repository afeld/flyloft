require 'spec_helper'

describe "gigs/index.html.haml" do
  before(:each) do
    assign(:gigs, [
      stub_model(Gig,
        :title => "Title",
        :company => "Company",
        :org_id => 1,
        :description => "MyText",
        :contact_first_name => "Contact First Name",
        :contact_last_name => "Contact Last Name",
        :contact_email => "Contact Email",
        :creator_id => 1,
        :city => "City",
        :state => "State",
        :country => "Country",
        :enabled => false,
        :view_count => 1
      ),
      stub_model(Gig,
        :title => "Title",
        :company => "Company",
        :org_id => 1,
        :description => "MyText",
        :contact_first_name => "Contact First Name",
        :contact_last_name => "Contact Last Name",
        :contact_email => "Contact Email",
        :creator_id => 1,
        :city => "City",
        :state => "State",
        :country => "Country",
        :enabled => false,
        :view_count => 1
      )
    ])
  end

  it "renders a list of gigs" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Company".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Contact First Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Contact Last Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Contact Email".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "City".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "State".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Country".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
