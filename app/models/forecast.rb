class Forecast

	def initialize(weather_data, location_data)
		@city = location_data[:city]
		@state = location_data[:state]
		@country = location_data[:country]
	end

end