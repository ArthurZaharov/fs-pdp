class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  respond_to :js

  expose_decorated(:article)
  expose_decorated(:comments, ancestor: :article) { |scope| scope.includes(:user) }
  expose(:comment, attributes: :comment_params)

  def create
    comment.user = current_user
    comment.save!
    respond_with(comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
