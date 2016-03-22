class FetchGeoLocationFromAddress
  include Interactor

  delegate :geo_params, to: :context

  def call
    context.geo_location = geo_location
  end

  private

  def geo_location
    return default_location if geo_params_empty? || !geo.success

    {
      latitude: geo.lat,
      longitude: geo.lng
    }
  end

  def full_address
    [address, city, country].compact.join(", ")
  end

  def country
    geo_params[:country].presence
  end

  def city
    geo_params[:city].presence
  end

  def address
    geo_params[:address].presence
  end

  def default_location
    {
      latitude: "25.215062",
      longitude: "55.190368"
    }
  end

  def geo_params_empty?
    geo_params.values.all?(&:empty?)
  end

  def geo
    @geo ||= Geokit::Geocoders::MultiGeocoder.geocode(full_address)
  end
end
