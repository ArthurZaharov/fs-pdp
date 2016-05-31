class Article < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search_by_content,
    against: %w(title content),
    using: { tsearch: { prefix: true } }

  enum kind: {
    free: "free",
    paid: "paid"
  }

  validates :title, :content, :user, presence: true
  validates :kind, inclusion: { in: %w(free paid) }

  belongs_to :user
  has_many :comments

  scope :recent, -> { order(created_at: :desc) }

  delegate :full_name, :email, to: :user, prefix: true
end
