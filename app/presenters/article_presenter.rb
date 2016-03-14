class ArticlePresenter < ApplicationPresenter
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper

  attr_reader :article

  delegate :id, :title, to: :article

  def initialize(article)
    @article = article
  end

  def content
    simple_format(article.content)
  end

  def posted_by
    "#{article.user_full_name} posted #{time_ago_in_words(article.created_at)} ago"
  end

  def user_avatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(article.user_email).downcase}.png"
  end
end
