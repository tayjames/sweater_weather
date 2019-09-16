class DailyForecast
  attr_reader :high, :low, :summary, :precipitation, :daily_time

  def initialize(attributes)
    @high = attributes[:temperatureHigh]
    @low = attributes[:temperatureLow]
    @summary = attributes[:summary]
    @precipitation = attributes[:precipProbability]
    @daily_time = attributes[:time]
  end
end
