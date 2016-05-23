class SearchArticlesController < ApplicationController
  respond_to :json

  expose(:articles) { Article.search_by_content(search_params) }

  def index
    respond_with(articles)
  end

  private

  def search_params
    params.require(:query)
  end
end
