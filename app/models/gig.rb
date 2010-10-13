class Gig < ActiveRecord::Base
  default_value_for :view_count, 0
  
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :org
end
