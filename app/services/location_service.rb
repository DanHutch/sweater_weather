class LocationService

	def self.get_coords(location)
		new.get_coords(location)
	end

	def get_coords(location)
		data = get_json("/maps/api/geocode/json?key=#{ENV["GOOGLE_API_KEY"]}&address=#{location}")
		info = Hash.new()
		info[:coords] = data[:results].first[:geometry][:location]
		locale = data[:results].first[:address_components]
		info[:city] = locale[0][:long_name]
		info[:state] = locale[2][:long_name]
		info[:country] = locale[3][:long_name]
		return info
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