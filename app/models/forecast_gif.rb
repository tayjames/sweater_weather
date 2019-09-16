class ForecastGif
  def initialize(attributes)
    @url = attributes[:data][0][:url]
  end
end
