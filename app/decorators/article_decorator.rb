class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :kind, :content, :user
end
