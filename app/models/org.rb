class Org < ActiveRecord::Base
  belongs_to :contact_person, :class_name => 'User'
end
