class Audition < ActiveRecord::Base
  include Locatable
  
  belongs_to :gig
end
