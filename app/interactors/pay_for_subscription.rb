class PayForSubscription
  include Interactor

  delegate :subscription_type, :author_id, :stripe_email, :stripe_token, to: :context

  def call
    Stripe::Charge.create(
      customer:    customer.id,
      amount:      amount.to_i,
      description: "Subscribe to #{author.full_name}",
      currency:    "usd"
    )

  rescue Stripe::CardError => e
    context.fail!(message: e.message)
  end

  private

  def author
    User.find_by(id: author_id)
  end

  def amount
    author.subscription_prices[subscription_type.to_sym].to_f * 100
  end

  def customer
    Stripe::Customer.create(email: stripe_email, source: stripe_token)
  end
end
