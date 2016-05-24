class SearchAuthorsController < ApplicationController
  respond_to :json

  expose(:articles) { Article.search_by_content(search_params) }
  expose(:authors) { User.where(id: articles.pluck(:id)).limit(5) }

  def index
    respond_with(authors)
  end

  private

  def search_params
    params.require(:query)
  end
end
