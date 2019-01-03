class LocationService

	def get_coords(location)
		response = get_json("/maps/api/geocode/json?key=#{ENV["GOOGLE_API_KEY"]}&address=#{location}")
		coords = response[:results].first[:geometry][:location]
	end

	private

	def get_json(url)
		response = conn.get(url)
		parsed = JSON.parse(response.body, symbolize_names: true)
	end

	def conn
		Faraday.new(url: "https://maps.googleapis.com") do |faraday|
			faraday.adapter Faraday.default_adapter
		end
	end

end
# https://maps.googleapis.com/maps/api/geocode/outputFormat?parameters
