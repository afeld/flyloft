class Org < ActiveRecord::Base
  include Locatable

  belongs_to :contact_person, :class_name => 'User'
  has_many :gigs
  has_many :org_memberships, :dependent => :destroy
  has_many :members, :through => :org_memberships, :source => :user
  
  def to_s
    self.name
  end
end
