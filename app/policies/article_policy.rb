class ArticlePolicy < ApplicationPolicy
  def edit?
    user == object.user
  end

  alias update? edit?

  def show?
    return true if object.free?
    return false unless user

    user.subscribed_to?(object.user)
  end
end
