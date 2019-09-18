require 'rails_helper'

RSpec.describe "Returns a background of a location" do
  it "can return a background given a location" do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    expect(response.content_type).to eq("application/json")
  end
end
