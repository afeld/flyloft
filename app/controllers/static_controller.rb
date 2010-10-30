class StaticController < ApplicationController
  def home
    @gigs = Gig.all(:limit => 20, :order => :post_at, :conditions => {:enabled => true})
  end
end
