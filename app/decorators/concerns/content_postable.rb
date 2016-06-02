module ContentPostable
  extend ActiveSupport::Concern

  included do
    include LocalTimeHelper
  end

  def posted_by
    "#{object.user_full_name} posted #{local_time_ago(object.created_at)}".html_safe
  end
end
