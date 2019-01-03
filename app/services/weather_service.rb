class WeatherService

	def self.get_weather(coords)
		new.get_weather(coords)
	end

	def get_weather(coords)
		data = get_json("/forecast/#{ENV["DARK_SKY_API_KEY"]}/#{coords[:lat]},#{coords[:lng]}")
	end

	private

		def get_json(url)
			response = conn.get(url)
			parsed = JSON.parse(response.body, symbolize_names: true)
		end

		def conn
			Faraday.new(url: "https://api.darksky.net") do |faraday|
			faraday.adapter Faraday.default_adapter
			end
		end

end