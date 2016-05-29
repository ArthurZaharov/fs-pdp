class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  expose_decorated(:author, model: :user, decorator: UserDecorator)
  expose_decorated(:subscription, attributes: :subscription_params)

  def new
  end

  def create
  end

  private

  def subscription_params
    params.require(:subscription).permit(:card_number, :card_month, :card_year, :card_cvv)
  end
end
