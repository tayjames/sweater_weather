require 'rails_helper'

RSpec.describe "Returns a forecast for the antipode of a location" do
  it "can return a forecast given a location" do
    get '/api/v1/antipode?location=hongkong'

    expect(response).to be_successful
    forecast_data = JSON.parse(response.body, symbolize_names: true)

    expect(response.content_type).to eq("application/json")
    expect(forecast_data.class).to eq(Hash)
    expect(forecast_data[:data][:attributes][:antipode_forecast].keys).to eq([:locacion, :ciudad, :temperatura, :sumario])
  end
end
