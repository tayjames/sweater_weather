require 'rails_helper'

RSpec.describe Coordinate, type: :model do
  it "exists" do
    attrs = {
      latitude: 123,
      longitude: 321,
    }

    coordinate = Coordinate.new(attrs)

    expect(coordinate).to be_a Coordinate
    expect(coordinate.latitude).to eq(123)
    expect(coordinate.longitude).to eq(321)
  end
end
