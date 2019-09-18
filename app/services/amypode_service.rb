class AmypodeService
  def antipode_by_coordinates(coords)
    amypode_conn = Faraday.new(url: "http://amypode.herokuapp.com") do |f|
      f.headers["api_key"] = ENV['AMY_API_KEY']
      f.adapter Faraday.default_adapter
    end

    amypode_response = amypode_conn.get("/api/v1/antipodes?lat=#{coords[:lat]}&long=#{coords[:lng]}")
    antipode_data = JSON.parse(amypode_response.body, symbolize_names: true)[:data][:attributes]
  end
end
