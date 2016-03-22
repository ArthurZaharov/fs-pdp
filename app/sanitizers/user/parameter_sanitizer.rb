class User
  class ParameterSanitizer < Devise::ParameterSanitizer
    SIGN_UP_PARAMS = %i(
      full_name
      email
      password
      password_confirmation
    ).freeze

    USER_PARAMS = %i(
      country
      city
      address
    ).freeze

    def sign_up
      default_params.permit(SIGN_UP_PARAMS)
    end

    def account_update
      default_params.permit(SIGN_UP_PARAMS, USER_PARAMS, :current_password)
    end
  end
end
