class CommentDecorator < ApplicationDecorator
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::AssetTagHelper

  include ContentPostable

  delegate :id, :title, :content

  def user_avatar
    image_tag(user_avatar_url, alt: object.user_full_name)
  end

  private

  def user_avatar_url
    "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(object.user_email).downcase}.png"
  end
end
