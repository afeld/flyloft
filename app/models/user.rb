class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :created_gigs, :class_name => 'Gig', :foreign_key => 'creator_id', :dependent => :nullify
  has_many :org_memberships, :dependent => :destroy
  has_many :memberships, :through => :org_memberships, :source => :org
  has_many :contact_person_for, :class_name => 'Org', :foreign_key => 'contact_person_id', :dependent => :nullify
  has_and_belongs_to_many :roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me
  
  def display_name
    [first_name, last_name].join(" ")
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end
  
  def is_org_admin?(org)
    OrgMembership.exists? :org_id => org, :user_id => self, :is_admin => true
  end
end
