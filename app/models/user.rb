class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :org_memberships
  has_many :memberships, :through => :org_memberships, :source => :org
  has_many :contact_person_for, :class_name => :org, :foreign_key => 'contact_person_id', :dependent => :nullify

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
end
