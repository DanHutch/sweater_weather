require 'rails_helper'

RSpec.describe 'Google geocoding API request' do
	it 'returns coordinates' do

		VCR.use_cassette("vcr_location_results") do
			response = LocationService.get_coords("denver,co")

			expect(response[:coords][:lat]).to be_a Float
			expect(response[:coords][:lng]).to be_a Float
		end
	end
end