class DarkService
  def forecast_by_coordinates(coords)
    darksky_conn = Faraday.new(url: "https://api.darksky.net") do |f|
      f.adapter Faraday.default_adapter
    end

    darksky_response = darksky_conn.get("/forecast/#{ENV['DS_KEY']}/#{coords[:lat]},#{coords[:lng]}")
    forecast_data = JSON.parse(darksky_response.body, symbolize_names: true)
  end
end
