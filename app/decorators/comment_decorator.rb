class CommentDecorator < ApplicationDecorator
  delegate :id, :title, :content
end
