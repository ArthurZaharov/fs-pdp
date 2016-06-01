class UserSubscriptionsController < ApplicationController
  expose_decorated(:subscriptions) { current_user.subscriptions.includes(:author) }

  def index
  end
end
