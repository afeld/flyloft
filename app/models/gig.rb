class Gig < ActiveRecord::Base
  include Locatable
  
  default_value_for :view_count, 0
  default_value_for :post_at, DateTime.now
  default_value_for :expire_at, DateTime.now + 30.days
  default_value_for :enabled, true
  
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :org
  has_many :auditions, :dependent => :destroy
  
  accepts_nested_attributes_for :auditions, :reject_if => :all_blank, :allow_destroy => true
  
  validates :title, :presence => true
  validate :expire_at_later_than_post_at
  validate :post_and_expire_must_be_present_to_enable
  
  
  def is_published?
    !self.new_record? and self.enabled
  end
  
  def is_draft?
    !self.new_record? and !self.enabled
  end
  
  
  private
  
  def expire_at_later_than_post_at
    if self.post_at and self.expire_at and self.post_at > self.expire_at
      errors.add(:expire_at, "must be later than the posting date")
    end
  end
  
  def post_and_expire_must_be_present_to_enable
    if self.enabled
      if self.post_at.blank?
        errors.add(:enabled, "cannot be checked unless posting date is set")
      end
      if self.enabled and self.expire_at.blank?
        errors.add(:enabled, "cannot be checked unless expiration date is set")
      end
    end
  end
end
