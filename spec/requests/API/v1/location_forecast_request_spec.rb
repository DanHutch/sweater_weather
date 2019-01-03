require 'rails_helper'

RSpec.describe 'GET /api/v1/forecast' do
  it 'returns a multiday forecast' do
    stub_coords_api_calls
    stub_weather_api_calls

    get "/api/v1/forecast?location=denver,co"

    expect(response).to be_successful


    forecast = JSON.parse(response.body, symbolize_names: true)

    expect(forecast).to have_key(:data)
    expect(forecast[:data]).to have_key(:id)
    expect(forecast[:data]).to have_key(:type)
    expect(forecast[:data]).to have_key(:attributes)

  end
end