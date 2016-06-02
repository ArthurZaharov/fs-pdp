class ArticleDecorator < ApplicationDecorator
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::AssetTagHelper

  include ContentPostable

  delegate :id, :title, :kind, :content, :user

  def type
    content_tag(:span, "#{object.kind} article", class: "label radius#{label_color}")
  end

  def content_excerpt
    object.content.truncate(500, separator: " ")
  end

  private

  def label_color
    object.free? ? " secondary" : ""
  end
end
