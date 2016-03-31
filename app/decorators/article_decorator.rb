class ArticleDecorator < ApplicationDecorator
  delegate :id, :title, :content, :user
end
