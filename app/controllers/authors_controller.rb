class AuthorsController < ApplicationController
  respond_to :json

  expose(:authors) { AuthorsWithinRadiusQuery.new(center: center, radius: radius).all }

  def index
    respond_with(authors)
  end

  private

  def center
    params["center"].values
  end

  def radius
    params["radius"]
  end
end
