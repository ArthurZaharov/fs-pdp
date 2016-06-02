class ArticlePolicy < ApplicationPolicy
  def manage?
    owner?
  end

  def show?
    return true if object.free?
    return false unless user

    owner? || user.subscribed_to?(object.user)
  end
end
