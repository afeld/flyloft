class Org < ActiveRecord::Base
  belongs_to :contact_person, :class_name => 'User'
  has_many :org_memberships, :dependent => :destroy
  has_many :members, :through => :org_memberships, :source => :user
end
