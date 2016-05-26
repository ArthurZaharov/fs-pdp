class UserPolicy < ApplicationPolicy
  def subscribe?
    object.paid_subscriptions? && object != user
  end
end
