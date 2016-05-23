class Article < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_content,
                  against: %w(title content),
                  using: { tsearch: { prefix: true } }

  validates :title, :content, :user, presence: true

  belongs_to :user
  has_many :comments

  scope :recent, -> { order(created_at: :desc) }

  delegate :full_name, :email, to: :user, prefix: true
end
