Geocoder.configure(
  timeout: 10,
  lookup: :google,
  api_key: ENV.fetch("GOOGLE_MAPS_API_KEY", "")
)
