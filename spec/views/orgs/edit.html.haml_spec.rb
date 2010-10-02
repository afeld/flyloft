require 'spec_helper'

describe "orgs/edit.html.haml" do
  before(:each) do
    @org = assign(:org, stub_model(Org,
      :new_record? => false,
      :name => "MyString",
      :phone => "MyString",
      :street => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => 1,
      :country => "MyString",
      :mission => "MyText",
      :contact_person => 1,
      :founding_year => 1
    ))
  end

  it "renders the edit org form" do
    render

    rendered.should have_selector("form", :action => org_path(@org), :method => "post") do |form|
      form.should have_selector("input#org_name", :name => "org[name]")
      form.should have_selector("input#org_phone", :name => "org[phone]")
      form.should have_selector("input#org_street", :name => "org[street]")
      form.should have_selector("input#org_city", :name => "org[city]")
      form.should have_selector("input#org_state", :name => "org[state]")
      form.should have_selector("input#org_zip", :name => "org[zip]")
      form.should have_selector("input#org_country", :name => "org[country]")
      form.should have_selector("textarea#org_mission", :name => "org[mission]")
      form.should have_selector("input#org_contact_person", :name => "org[contact_person]")
      form.should have_selector("input#org_founding_year", :name => "org[founding_year]")
    end
  end
end
