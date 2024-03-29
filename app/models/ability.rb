class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User

    return unless user.present?

    can :manage, Group, user_id: user.id
    can :manage, Deal, user_id: user.id
  end
end
