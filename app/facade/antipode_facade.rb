class AntipodeFacade
  attr_reader :location, :id

  def initialize(location)
    @location = location
    @id = 1
  end

  def antipode
    get_antipode(@location)
  end

  def get_antipode(location)
    service = GoogleService.new
    coords = service.coordinates_by_location(location)

    amypode_conn = Faraday.new(url: "http://amypode.herokuapp.com") do |f|
      f.headers["api_key"] = ENV['AMY_API_KEY']
      f.adapter Faraday.default_adapter
    end

    amypode_response = amypode_conn.get("/api/v1/antipodes?lat=#{coords[:lat]}&long=#{coords[:lng]}")
    antipode_data = JSON.parse(amypode_response.body, symbolize_names: true)[:data][:attributes]
    # binding.pry
    antipode_lat = antipode_data[:lat]
    antipode_long = antipode_data[:long]

    reverse_conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |f|
      f.adapter Faraday.default_adapter
    end

    reverse_response = reverse_conn.get("?latlng=#{antipode_lat},#{antipode_long}&key=#{ENV['API_KEY']}")
    reverse_data = JSON.parse(reverse_response.body, symbolize_names: true)[:results][0][:geometry][:location]
    reverse_lat = reverse_data[:lat]
    reverse_long = reverse_data[:lng]

    darksky_conn = Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end

    darksky_response = darksky_conn.get("/forecast/#{ENV['DS_KEY']}/#{reverse_lat},#{reverse_long}")
    forecast_data = JSON.parse(darksky_response.body, symbolize_names: true)
  end

  def get_coordinates

  end

  def antipode_forecast
    AntipodeForecast.new(get_antipode(location), @location)
  end
end
