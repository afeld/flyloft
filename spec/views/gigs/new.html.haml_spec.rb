require 'spec_helper'

describe "gigs/new.html.haml" do
  before(:each) do
    assign(:gig, stub_model(Gig,
      :new_record? => true,
      :title => "MyString",
      :company => "MyString",
      :org_id => 1,
      :description => "MyText",
      :contact_first_name => "MyString",
      :contact_last_name => "MyString",
      :contact_email => "MyString",
      :creator_id => 1,
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :enabled => false,
      :view_count => 1
    ))
  end

  it "renders new gig form" do
    render

    rendered.should have_selector("form", :action => gigs_path, :method => "post") do |form|
      form.should have_selector("input#gig_title", :name => "gig[title]")
      form.should have_selector("input#gig_company", :name => "gig[company]")
      form.should have_selector("input#gig_org_id", :name => "gig[org_id]")
      form.should have_selector("textarea#gig_description", :name => "gig[description]")
      form.should have_selector("input#gig_contact_first_name", :name => "gig[contact_first_name]")
      form.should have_selector("input#gig_contact_last_name", :name => "gig[contact_last_name]")
      form.should have_selector("input#gig_contact_email", :name => "gig[contact_email]")
      form.should have_selector("input#gig_city", :name => "gig[city]")
      form.should have_selector("input#gig_state", :name => "gig[state]")
      form.should have_selector("input#gig_country", :name => "gig[country]")
      form.should have_selector("input#gig_enabled", :name => "gig[enabled]")
      form.should have_selector("input#gig_view_count", :name => "gig[view_count]")
    end
  end
end
