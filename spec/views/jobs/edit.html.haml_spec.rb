require 'spec_helper'

describe "jobs/edit.html.haml" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :new_record? => false,
      :title => "MyString"
    ))
  end

  it "renders the edit job form" do
    render

    rendered.should have_selector("form", :action => job_path(@job), :method => "post") do |form|
      form.should have_selector("input#job_title", :name => "job[title]")
    end
  end
end
