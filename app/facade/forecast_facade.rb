class ForecastFacade
  attr_reader :location, :id

  def initialize(city_state)
    @location = city_state
    @id = 8
  end

  def forecast
    get_forecast(@location)
  end

  def get_forecast(location)
    google_service = GoogleService.new
    coords = google_service.coordinates_by_location(location)

    darksky_service = DarkService.new
    forecast = darksky_service.forecast_by_coordinates(coords)
  end

  def current_forecast
    CurrentForecast.new(get_forecast(location)[:currently])
  end

  def daily_forecast
    get_forecast(location)[:daily][:data].map do |daily|
      DailyForecast.new(daily)
    end.take(5)
  end

  def hourly_forecast
    get_forecast(location)[:hourly][:data].map do |hourly|
      HourlyForecast.new(hourly)
    end.take(8)
  end
end
