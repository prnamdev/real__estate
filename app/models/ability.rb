# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.broker?
      can :manage, Property, user: user
    else
      can :read, Property
    end
  end
end
