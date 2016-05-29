class Subscription < ActiveRecord::Base
  attr_accessor :card_number, :card_month, :card_year, :card_cvv

  belongs_to :user
  belongs_to :author, class_name: :user

  validates :user, :author, :expired_at, presence: true
end
