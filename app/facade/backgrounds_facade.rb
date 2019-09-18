class BackgroundsFacade
  def initialize(location)
    @location = location
    @id = 2
  end

  def background
    get_background(@location)
  end

  def get_background(location)
    background_service = BackgroundService.new
    background = background_service.background_by_location(location)
  end
end
