class Coordinate
  attr_reader :latitude, :longitude

  def initialize(attrs={})
    @latitude = attrs[:lat]
    @longitude = attrs[:lng]
  end
end
