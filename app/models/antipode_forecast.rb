class AntipodeForecast
  attr_reader :ciudad, :temperatura, :sumario
  
  def initialize(attributes)
    @ciudad = attributes[:timezone].split("/").last
    @temperatura = attributes[:currently][:temperature]
    @sumario = attributes[:currently][:summary]
  end
end
