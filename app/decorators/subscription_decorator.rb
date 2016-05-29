class SubscriptionDecorator < ApplicationDecorator
  delegate :id, :card_number, :card_month, :card_year, :card_cvv
end
