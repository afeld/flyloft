require 'spec_helper'

describe "gigs/show.html.haml" do
  before(:each) do
    @gig = assign(:gig, stub_model(Gig,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
    rendered.should contain("Company".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain("Contact First Name".to_s)
    rendered.should contain("Contact Last Name".to_s)
    rendered.should contain("Contact Email".to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("City".to_s)
    rendered.should contain("State".to_s)
    rendered.should contain("Country".to_s)
    rendered.should contain(false.to_s)
    rendered.should contain(1.to_s)
  end
end
