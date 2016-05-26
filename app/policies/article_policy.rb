class ArticlePolicy < ApplicationPolicy
  def manage?
    user == object.user
  end
end
