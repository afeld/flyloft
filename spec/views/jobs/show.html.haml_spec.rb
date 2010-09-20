require 'spec_helper'

describe "jobs/show.html.haml" do
  before(:each) do
    @job = assign(:job, stub_model(Job,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Title".to_s)
  end
end
