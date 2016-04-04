class AuthorsController < ApplicationController
  respond_to :json

  expose(:authors) { AuthorsWithinBoundingBoxQuery.new(search_params).all }

  def index
    respond_with(authors)
  end

  private

  def search_params
    params.require(:bounds)
  end
end
