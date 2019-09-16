class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :current_forecast, :daily_forecast, :hourly_forecast
end
