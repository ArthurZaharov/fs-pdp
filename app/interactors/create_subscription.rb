class CreateSubscription
  include Interactor

  SUBSCRIPTION_DAYS = {
    weekly_subscription_price: 7,
    monthly_subscription_price: 30,
    yearly_subscription_price: 365
  }.freeze

  delegate :author_id, :current_user_id, :subscription_type, :charge, to: :context

  def call
    context.fail!(message: "Cannot create subscription") unless subscription.save
  end

  private

  def subscription
    Subscription.new(
      author_id: author_id,
      user_id: current_user_id,
      charge_id: charge["id"],
      expired_at: expired_at
    )
  end

  def expired_at
    Time.zone.today + SUBSCRIPTION_DAYS[subscription_type.to_sym]
  end
end
