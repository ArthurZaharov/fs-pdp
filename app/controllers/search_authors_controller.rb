class SearchAuthorsController < ApplicationController
  respond_to :json

  expose(:articles) { Article.search_by_content(params[:query]) }
  expose(:authors) { User.where(id: articles.pluck(:id)).limit(5) }

  def index
    respond_with(authors)
  end
end
