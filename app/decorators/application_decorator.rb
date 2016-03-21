class ApplicationDecorator < Draper::Decorator
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::AssetTagHelper

  delegate :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def formatted_content
    simple_format(object.content)
  end

  def posted_by
    "#{object.user_full_name} posted #{time_ago_in_words(object.created_at)} ago"
  end

  def user_avatar
    image_tag(user_avatar_url, size: "45", alt: object.user_full_name)
  end

  private

  def user_avatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(object.user_email).downcase}.png"
  end
end
