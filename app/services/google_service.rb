class GoogleService

  def coordinates_by_location(location)
    google_conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json?") do |f|
      f.adapter Faraday.default_adapter
    end
    #getting coordinates
    google_response = google_conn.get("?address=#{location}&key=#{ENV['API_KEY']}")
    coordinate_data = JSON.parse(google_response.body, symbolize_names: true)[:results][0][:geometry][:location]
  end
end
