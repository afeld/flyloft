Given /^gigs with the following view counts:$/ do |table|
  @gig_ids = []
  table.raw.each do |row|
    @gig_ids << Gig.create(:view_count => row.first.to_i).id
  end
end

When /^I visit each gig$/ do
  @gig_ids.each do |gig_id|
    visit gig_path(gig_id)
  end
end

Then /^the view counts should be:$/ do |table|
  @gig_ids.each_index do |i|
    Gig.find(@gig_ids[i]).view_count.should == table.raw[i].first.to_i
  end
end

