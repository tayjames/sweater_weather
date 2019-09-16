class GifsFacade
  def initialize(location) #should i be initializing with weather instead?
    @location = location
  end

  def gif
    get_gif(@location)
  end

  def get_gif(location)
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

    five_day_forecast = forecast_data[:daily][:data].map do |day|
      DailyForecast.new(day)
    end.take(5)

    five_day_summary = five_day_forecast.map do |day|
      day.summary
    end



    giphy_conn = Faraday.new(url: "https://api.giphy.com") do |f|
      f.params["api_key"] = ENV["GIPHY_API_KEY"]
      f.params["q"] = five_day_summary[0]
      f.adapter Faraday.default_adapter
    end

    giphy_response = giphy_conn.get("/v1/gifs/search")
    binding.pry

    JSON.parse(giphy_response.body, symbolize_names: true)
  end
end
