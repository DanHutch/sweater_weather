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

    expect(results).to have_key(:data)
    expect(results[:data][:attributes]).to have_key(:daily_forecasts)
    expect(results[:data][:attributes][:daily_forecasts]).to be_a Array
    expect(results[:data][:attributes]).to have_key(:copyright)

    results[:data][:attributes][:daily_forecasts].each do |daily|
      expect(daily).to be_a Hash
      expect(daily).to have_key(:time)
      expect(daily).to have_key(:summary)
      expect(daily).to have_key(:url)
    end

  end

end