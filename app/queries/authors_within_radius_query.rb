class AuthorsWithinRadiusQuery
  attr_reader :center, :radius
  private :center, :radius

  NEW_ORLEANS_COORDS = [29.951066, -90.071532].freeze

  def initialize(center:, radius:)
    @center = center || NEW_ORLEANS_COORDS
    @radius = radius || 50
  end

  def all
    User.within_bounding_box(bounding_box)
  end

  private

  def bounding_box
    Geocoder::Calculations.bounding_box(center, radius)
  end
end
