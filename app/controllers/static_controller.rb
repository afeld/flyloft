class StaticController < ApplicationController
  def home
    @gigs = Gig.all(:limit => 20, :order => :post_date, :conditions => {:enabled => true})
  end
end
