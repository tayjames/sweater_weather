class CurrentForecast
  attr_reader :icon, :temperature, :feels_like, :humidity, :visibility, :uv_index, :summary

  def initialize(attributes)
    @icon = attributes[:icon]
    @temperature = attributes[:tempurature]
    @feels_like = attributes[:apparentTemperature]
    @humidity = attributes[:humidity]
    @visibility = attributes[:visibility]
    @uv_index = attributes[:uvIndex]
    @summary = attributes[:summary]
  end
end
