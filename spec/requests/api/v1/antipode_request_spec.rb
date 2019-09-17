require 'rails_helper'

RSpec.describe "Returns a forecast for the antipode of a location" do
  it "can return a forecast given a location" do
    get '/api/v1/antipode?location=hongkong'

    expect(response).to be_successful
    forecast_data = JSON.parse(response.body, symbolize_names: true)
    # binding.pry

    # expect(response.content_type).to eq("application/json")
    # expect(forecast_data.class).to eq(Hash)
    # expect(forecast_data[:data][:attributes].class).to eq(Hash)
    # expect(forecast_data[:data][:attributes].keys).to eq([:current_forecast, :daily_forecast, :hourly_forecast])
    # expect(forecast_data[:data][:attributes][:current_forecast].keys).to eq([:icon, :temperature, :feels_like, :humidity, :visibility, :uv_index, :summary])
    # expect(forecast_data[:data][:attributes][:daily_forecast].count).to eq(5)
    # expect(forecast_data[:data][:attributes][:daily_forecast][0].keys).to eq([:high, :low, :summary, :precipitation])
    # expect(forecast_data[:data][:attributes][:hourly_forecast].count).to eq(8)
    # expect(forecast_data[:data][:attributes][:hourly_forecast][0].keys).to eq([:time, :hourly_temperature])
  end
end
