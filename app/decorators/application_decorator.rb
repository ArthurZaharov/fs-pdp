class ApplicationDecorator < Draper::Decorator
  delegate :to_model, :cache_key

  def self.collection_decorator_class
    PaginatingDecorator
  end
end
