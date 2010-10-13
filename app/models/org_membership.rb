class OrgMembership < ActiveRecord::Base
  default_value_for :is_admin, true
  
  belongs_to :user
  belongs_to :org
end
