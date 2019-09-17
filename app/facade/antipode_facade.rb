class AntipodeFacade
  def initialize(location)
    @location = location
    @id = 1
  end

  def antipode
    get_antipode(@location)
  end

  def get_antipode(location)
    google_conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json?") do |f|
      f.adapter Faraday.default_adapter
    end

    google_response = google_conn.get("?address=#{@location}&key=#{ENV['API_KEY']}")

    coordinate_data = JSON.parse(google_response.body, symbolize_names: true)[:results]
    latitude = coordinate_data[0][:geometry][:location][:lat]
    longitude = coordinate_data[0][:geometry][:location][:lng]
    binding.pry

    # darksky_conn = Faraday.new(url: "https://api.darksky.net") do |f|
    #   f.adapter Faraday.default_adapter
    # end
    #
    # darksky_response = darksky_conn.get("/forecast/#{ENV['DS_KEY']}/#{latitude},#{longitude}")
    # forecast_data = JSON.parse(darksky_response.body, symbolize_names: true)
  end
end
