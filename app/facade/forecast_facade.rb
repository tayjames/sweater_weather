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
    # service = GoogleService.new
    # service.coordinates_by_location(location).map do |location_data|
    #   Coordinate.new(location_data)
    # end


    google_conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json?") do |f|
      f.adapter Faraday.default_adapter
    end

    google_response = google_conn.get("?address=#{@location}&key=#{ENV['API_KEY']}")

    coordinate_data = JSON.parse(google_response.body, symbolize_names: true)[:results]

    latitude = coordinate_data[0][:geometry][:location][:lat]
    longitude = coordinate_data[0][:geometry][:location][:lng]

    darksky_conn = Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end

    darksky_response = darksky_conn.get("/forecast/#{ENV['DS_KEY']}/#{latitude},#{longitude}")
    forecast_data = JSON.parse(darksky_response.body, symbolize_names: true)
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
