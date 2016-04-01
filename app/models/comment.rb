class Comment < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :user
  belongs_to :article

  delegate :full_name, :email, to: :user, prefix: true
end
