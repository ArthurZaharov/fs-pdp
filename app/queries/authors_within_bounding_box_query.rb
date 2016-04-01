class AuthorsWithinBoundingBoxQuery
  attr_reader :sw_point, :ne_point
  private :sw_point, :ne_point

  def initialize(args)
    args = (args || {}).deep_symbolize_keys

    @sw_point = args[:sw_point]
    @ne_point = args[:ne_point]
  end

  def all
    return User.none unless bounds?

    User.where(
      latitude: sw_point[:lat]..ne_point[:lat],
      longitude: sw_point[:lng]..ne_point[:lng]
    )
  end

  private

  def bounds?
    sw_point? && ne_point?
  end

  def sw_point?
    sw_point.present? && sw_point.keys == %i(lat lng)
  end

  def ne_point?
    ne_point.present? && ne_point.keys == %i(lat lng)
  end
end
