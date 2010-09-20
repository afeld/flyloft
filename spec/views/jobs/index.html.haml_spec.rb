require 'spec_helper'

describe "jobs/index.html.haml" do
  before(:each) do
    assign(:jobs, [
      stub_model(Job,
        :title => "Title"
      ),
      stub_model(Job,
        :title => "Title"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    rendered.should have_selector("tr>td", :content => "Title".to_s, :count => 2)
  end
end
