require 'rails_helper'

RSpec.describe 'Giphy API request' do
	it 'returns gif data' do

		VCR.use_cassette("vcr_gif_results") do
			response = GifService.new.get_gif("Clear+throughout+the+day")
      expect(response).to be_a Hash
			expect(response).to have_key(:data)
      expect(response[:data].first).to have_key(:images)
      expect(response[:data].first[:images]).to have_key(:downsized)
      expect(response[:data].first[:images][:downsized]).to have_key(:url)
      expect(response[:data].first[:images][:downsized][:url]).to be_a String
    end

	end
end