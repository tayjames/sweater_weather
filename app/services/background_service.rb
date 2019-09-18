class BackgroundService
  def background_by_location(location)
    unsplash_conn = Faraday.new(url: "https://api.unsplash.com/photos/random") do |f|
      f.adapter Faraday.default_adapter
    end

    unsplash_response = unsplash_conn.get("?client_id=#{ENV['UNSPLASH_KEY']}&query=#{location}")
    unsplash_data = JSON.parse(unsplash_response.body, symbolize_names: true)[:urls][:full]
  end
end
