class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update)
  before_action :authorize!, only: %i(show edit update)

  expose_decorated(:articles) { |scope| scope.includes(:user).recent.limit(10) }
  expose_decorated(:article, attributes: :article_params)
  expose(:comment) { article.comments.build }
  expose_decorated(:comments, ancestor: :article) { |scope| scope.includes(:user) }

  def index
  end

  def show
  end

  def new
  end

  def create
    article.user = current_user
    article.save
    respond_with(article)
  end

  def edit
  end

  def update
    article.save
    respond_with(article)
  end

  def destroy
    article.destroy
    respond_with(article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :kind, :content)
  end

  def authorize!
    authorize(article, "#{params[:action]}?")
  end
end
