class StaticController < ApplicationController
  def home
    @auditions = Audition.active.all :limit => 20, :order => "start_at DESC", :include => :gig
  end
end
