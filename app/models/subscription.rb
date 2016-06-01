class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :author, class_name: "User"

  validates :user, :author, :expired_at, presence: true

  delegate :full_name, to: :author, prefix: true
end
