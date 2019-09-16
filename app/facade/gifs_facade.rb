class GifsFacade
  def initialize(location) #should i be initializing with weather instead?
    @location = location
  end

  def gif
    get_gif(@location)
  end

  def get_gif(location)
    giphy_conn = Faraday.new(url: "https://api.giphy.com/v1/gifs/search") do |f|
      f.params["api_key"] = ENV["GIPHY_API_KEY"]
      f.adapter Faraday.default_adapter
    end

    giphy_response = giphy_conn.get("?location=#{@location}")

    JSON.parse(giphy_response.body, symbolize_names: true)
    binding.pry
  end
end
