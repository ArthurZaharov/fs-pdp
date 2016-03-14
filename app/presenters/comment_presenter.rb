class CommentPresenter < ApplicationPresenter
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper

  attr_reader :comment

  delegate :id, to: :comment

  def initialize(comment)
    @comment = comment
  end

  def content
    simple_format(comment.content)
  end

  def posted_by
    "#{comment.user_full_name} posted #{time_ago_in_words(comment.created_at)} ago"
  end

  def user_avatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(comment.user_email).downcase}.png"
  end
end
