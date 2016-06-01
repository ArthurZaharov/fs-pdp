class ArticlePolicy < ApplicationPolicy
  def edit?
    owner?
  end

  alias update? edit?

  def show?
    return true if object.free?
    return false unless user

    owner? || user.subscribed_to?(object.user)
  end
end
