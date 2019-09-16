class HourlyForecast
  attr_reader :time, :hourly_temperature
  
  def initialize(attributes)
    @time = attributes[:time]
    @hourly_temperature = attributes[:temperature]
  end
end
