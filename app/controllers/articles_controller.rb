class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: %i(new create edit update)
  before_action :authorize_user!, only: %i(edit update)

  expose(:articles) { Article.includes(:user).page(params[:page]) }
  expose(:article, attributes: :article_params)
  expose(:comment) { article.comments.build }
  expose(:comments) { article.comments.includes(:user) }

  expose(:articles_presenter) { ArticlePresenter.wrap(articles) }
  expose(:article_presenter) { ArticlePresenter.wrap(article) }
  expose(:comments_presenter) { CommentPresenter.wrap(comments) }

  def index
  end

  def show
  end

  def new
  end

  def create
    article.user = current_user
    article.save!
    respond_with(article)
  end

  def edit
  end

  def update
    article.save!
    respond_with(article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def authorize_user!
    return if ArticlePolicy.new(current_user, article).manage?
    redirect_to(root_url, alert: I18n.t("app.access_denied"))
  end
end
