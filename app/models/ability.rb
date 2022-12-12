class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      if user.admin?
        can :manage, :all
        can :manage, ActiveAdmin::Page, :name => "Dashboard"
      elsif user.doctor?
        can :manage, Comment
        can :read, Appointment
      else
        can :manage, :all
      end
  end
end
