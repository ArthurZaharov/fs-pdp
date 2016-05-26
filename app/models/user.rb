class User < ActiveRecord::Base
  geocoded_by :full_address
  after_validation :geocode

  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :full_name, presence: true
  validates :weekly_subscription_price,
    :monthly_subscription_price,
    :yearly_subscription_price,
    format: { with: /\A(\$)?(\d+)(\.|,)?\d{0,2}?\z/, allow_blank: true },
    numericality: { greater_than: 0.01, allow_blank: true }

  serialize :subscription_prices, HashSerializer
  store_accessor :subscription_prices,
    :weekly_subscription_price,
    :monthly_subscription_price,
    :yearly_subscription_price

  has_many :articles
  has_many :comments

  def to_s
    full_name
  end

  def full_address
    [address, city, country].reject(&:blank?).join(", ")
  end

  def paid_subscriptions?
    subscription_prices.values.any?(&:present?)
  end
end
