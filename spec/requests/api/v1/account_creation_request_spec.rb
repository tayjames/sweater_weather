require 'rails_helper'

RSpec.describe "Account creation" do
  it "can create an account" do
    post '/api/v1/users', params: {
      "email": "whatever@example.com",
      "password": "password",
      "password_confirmation": "password"
}

    expect(response).to be_successful
    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(response.content_type).to eq("application/json")
    expect(user_data[:data][:attributes].keys).to eq([:api_key])
  end
end
