class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :content
end
