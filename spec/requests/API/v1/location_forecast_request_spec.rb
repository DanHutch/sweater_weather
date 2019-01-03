require 'rails_helper'

RSpec.describe 'GET /api/v1/forecast' do
	it 'returns a multiday forecast' do
		stub_coords_api_calls

		get "/api/v1/forecast?location=denver,co"

		expect(response).to be_successful


		# forecast = JSON.parse(response.body, symbolize_names: true)

	end
end