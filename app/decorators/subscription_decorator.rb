class SubscriptionDecorator < ApplicationDecorator
  delegate :id, :expired_at, :author_full_name
end
