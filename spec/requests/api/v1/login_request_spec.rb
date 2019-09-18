require 'rails_helper'

RSpec.describe "Login" do
  it "can log a user in" do
    user = User.create!(email: "whatever@example.com", password: "password", api_key: "123")

    post '/api/v1/sessions', params: {
      "email": "whatever@example.com",
      "password": "password"
}
    expect(response).to be_successful
    user_data = JSON.parse(response.body, symbolize_names: true)
    expect(response.content_type).to eq("application/json")
    expect(user_data[:data][:attributes].keys).to eq([:api_key])
  end
end
