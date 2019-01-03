require 'rails_helper'

RSpec.describe 'Dark Sky weather API request' do
	it 'returns weather data' do

		VCR.use_cassette("vcr_weather_results") do
			response = WeatherService.get_weather({lat: 39.7392358, lng: -104.990251})
			expect(response).to be_a Hash
			expect(response).to have_key(:latitude)
			expect(response).to have_key(:longitude)
			expect(response).to have_key(:currently)
		end
	end
end