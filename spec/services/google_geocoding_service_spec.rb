require 'rails_helper'

RSpec.describe 'Google geocoding API request' do
	it 'returns coordinates' do

		VCR.use_cassette("vcr_location_results") do
			service = LocationService.new
			response = service.get_coords("denver,co")

			expect(response[:lat]).to be_a Float
			expect(response[:lng]).to be_a Float
		end
	end
end