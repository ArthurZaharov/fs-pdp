require "rails_helper"

describe FetchGeoLocationFromAddress do
  subject(:geo_location) { described_class.call(geo_params: geo_params).geo_location }
end
