class DailyForecast
  attr_reader :high, :low, :summary, :precipitation
  
  def initialize(attributes)
    @high = attributes[:temperatureHigh]
    @low = attributes[:temperatureLow]
    @summary = attributes[:summary]
    @precipitation = attributes[:precipProbability]
  end
end
