class PayForSubscription
  include Interactor

  delegate :subscription_type, :author_id, :stripe_token, to: :context

  def call
    context.charge = charge

  rescue Stripe::CardError => e
    context.fail!(message: e.message)
  end

  def rollback
    context.charge.refund
  end

  private

  def author
    User.find_by(id: author_id)
  end

  def amount
    author.subscription_prices[subscription_type.to_sym].to_f * 100
  end

  def charge
    Stripe::Charge.create(
      source:      stripe_token,
      amount:      amount.to_i,
      description: "Subscribe to #{author.full_name}",
      currency:    "usd"
    )
  end
end
