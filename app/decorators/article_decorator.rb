class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :kind, :content, :user

  def type
    content_tag(:span, "#{object.kind} article", class: "label radius #{label_color}")
  end

  private

  def label_color
    object.paid? ? "" : "secondary"
  end
end
