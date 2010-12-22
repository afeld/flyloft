class Audition < ActiveRecord::Base
  include Locatable
  
  belongs_to :gig
  
  scope :enabled, joins(:gig).where(:gigs => {:enabled => true})
  scope :in_the_future, where("start_at >= current_timestamp")
  scope :active, in_the_future.enabled
end
