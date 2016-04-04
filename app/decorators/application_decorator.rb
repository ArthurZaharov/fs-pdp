class ApplicationDecorator < Draper::Decorator
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::AssetTagHelper
  include LocalTimeHelper

  delegate :to_model, :cache_key

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def formatted_content
    simple_format(object.content)
  end

  def posted_by
    "#{object.user_full_name} posted #{local_time_ago(object.created_at)}".html_safe
  end

  def user_avatar
    image_tag(user_avatar_url, size: "45", alt: object.user_full_name)
  end

  private

  def user_avatar_url
    "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(object.user_email).downcase}.png"
  end
end
