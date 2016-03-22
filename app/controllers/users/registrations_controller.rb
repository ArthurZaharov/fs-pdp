module Users
  class RegistrationsController < Devise::RegistrationsController
    private

    def account_update_params
      devise_parameter_sanitizer
        .sanitize(:account_update)
        .merge(geo_location_from_params)
    end

    def geo_params
      params.require(:user).permit(:country, :city, :address)
    end

    def geo_location_from_params
      FetchGeoLocationFromAddress.call(geo_params: geo_params).geo_location
    end
  end
end
