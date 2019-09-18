class AntipodeFacade
  attr_reader :location, :id

  def initialize(location)
    @location = location
    @id = 1
  end

  def antipode
    get_antipode(@location)
  end

  def get_antipode(location)
    google_service = GoogleService.new
    coords = google_service.coordinates_by_location(location)

    amypode_service = AmypodeService.new
    amypode = amypode_service.antipode_by_coordinates(coords)

    reverse_service = ReverseService.new
    reverse = reverse_service.coordinates_by_antipode(amypode)

    dark_service = DarkService.new
    antipode_forecast = dark_service.forecast_by_coordinates(reverse)
  end

  def antipode_forecast
    AntipodeForecast.new(get_antipode(location), @location)
  end
end
