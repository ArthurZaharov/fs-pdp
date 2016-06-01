class UserArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!, only: %i(edit update destroy)

  expose_decorated(:article, attributes: :article_params)

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
    authorize(article, :manage?)
  end
end
