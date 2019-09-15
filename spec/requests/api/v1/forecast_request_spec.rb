require 'rails_helper'

RSpec.describe "Geocoding API" do
  it "can send a city and state" do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful 
  end
end
