class StaticController < ApplicationController
  def index
    @gigs = Gig.all(:limit => 20, :order => :post_date)
  end
end
