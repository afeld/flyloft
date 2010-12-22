class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.role? :super_admin
      can :manage, :all
    else
      can :read, :all
      can :manage, Gig do |gig|
        gig.try(:creator) == user
      end
      can :manage, Org do |org|
        user.is_org_admin? org
      end
    end
  end
end