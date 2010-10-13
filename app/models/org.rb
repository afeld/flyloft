class Org < ActiveRecord::Base
  belongs_to :contact_person, :class_name => 'User'
  has_many :org_members
  has_many :members, :through => :org_members, :source => :user
end
