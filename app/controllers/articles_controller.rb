class ArticlesController < ApplicationController
  expose_decorated(:articles) { |scope| scope.includes(:user).recent.limit(10) }
  expose_decorated(:article)
  expose(:comment) { article.comments.build }
  expose_decorated(:comments, ancestor: :article) { |scope| scope.includes(:user) }

  def index
  end

  def show
    authorize(article, :show?)
  end
end
