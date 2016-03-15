class CommentDecorator < ApplicationDecorator
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::DateHelper

  delegate :id, :title
end
