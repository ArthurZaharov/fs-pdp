class AuthorsController < ApplicationController
  respond_to :json, only: :index

  expose_decorated(:author, model: :user)
  expose_decorated(:articles, ancestor: :author)
  expose(:subscription) { current_user.subscriptions.where(author_id: author.id).first }

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
    AuthorsInLocationQuery.new(search_params).all
  end
end
