class CreateSubscription
  include Interactor

  delegate :author_id, :current_user_id, :subscription_type, to: :context

  def call
    Subscription.create(
      author_id: author_id,
      user_id: current_user_id,
      expired_at: expired_at
    )
  end

  private

  def expired_at
    Time.zone.today + subscription_days[subscription_type.to_sym]
  end

  def subscription_days
    {
      weekly_subscription_price: 7,
      monthly_subscription_price: 30,
      yearly_subscription_price: 365
    }
  end
end
