require 'rails_helper'

RSpec.describe "Returns a gif" do
  it "can return a gif given a location" do
    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful
    gif_data = JSON.parse(response.body, symbolize_names: true)
    # binding.pry

  end
end
