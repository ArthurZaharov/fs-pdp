class StaticPagesController < ApplicationController
  def show
    render(page_params[:page])
  end

  private

  def page_params
    params.permit(:page)
  end
end
