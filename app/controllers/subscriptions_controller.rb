class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  expose_decorated(:author, model: :user, decorator: UserDecorator)

  def create
    result = SubscribeToAuthor.call(
      subscription_type: params[:subscription_type],
      author_id: params[:author_id],
      current_user_id: current_user.id,
      stripe_email: params[:stripeEmail],
      stripe_token: params[:stripeToken]
    )

    if result.success?
      flash[:notice] = "Subscription created"
    else
      flash[:alert] = result.message
    end

    redirect_to(root_path)
  end
end
