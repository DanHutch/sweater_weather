require 'rails_helper'

RSpec.describe 'GET /api/v1/gifs' do
  it 'returns daily summaries with gif URLs' do
    stub_coords_api_calls
    stub_weather_api_calls
    # stub_gif_api_calls

    parameters = "?location=denver,co"

    get "/api/v1/gifs#{parameters}"

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)
binding.pry



  end

end