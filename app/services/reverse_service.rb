class ReverseService
  def coordinates_by_antipode(amypode)
    reverse_conn = Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |f|
      f.adapter Faraday.default_adapter
    end

    reverse_response = reverse_conn.get("?latlng=#{amypode[:lat]},#{amypode[:long]}&key=#{ENV['API_KEY']}")
    reverse_data = JSON.parse(reverse_response.body, symbolize_names: true)[:results][0][:geometry][:location]
    # reverse_lat = reverse_data[:lat]
    # reverse_long = reverse_data[:lng]
  end
end
