class AuthorsController < ApplicationController
  respond_to :json, only: :index

  expose_decorated(:author, model: :user)
  expose_decorated(:articles, ancestor: :author)

  def index
    respond_with(authors_in_bounds)
  end

  def show
  end

  private

  def search_params
    params.require(:bounds)
  end

  def authors_in_bounds
    AuthorsWithinBoundingBoxQuery.new(search_params).all
  end
end
