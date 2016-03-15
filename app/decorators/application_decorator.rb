class ApplicationDecorator < Draper::Decorator
  delegate :to_model

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def content
    simple_format(object.content)
  end

  def posted_by
    "#{object.user_full_name} posted #{time_ago_in_words(object.created_at)} ago"
  end

  def user_avatar_url
    "http://gravatar.com/avatar/#{Digest::MD5.hexdigest(object.user_email).downcase}.png"
  end
end
