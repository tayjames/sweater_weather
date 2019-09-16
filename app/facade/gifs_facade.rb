class GifsFacade
  def initialize(location) #should i be initializing with weather instead?
    @location = location
  end

  def gif
    get_gif(@location)
  end

  def get_gif
    giphy_conn = Faraday.new(url: "https://api.giphy.com/v1/gifs/search	")
  end
end
