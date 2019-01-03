class ForecastFacade

	def initialize(location)
		@location = location
	end

	def self.forecast(location)
		new(location).forecast
	end

	def forecast
		place_data = coord_results
		forecast = Forecast.new(weather_results(place_data[:coords]), place_data)
		#serializing will be done here (last line) to return to controller action
	end

	private

		def weather_results(coords)
			@_weather ||= WeatherService.get_weather(coords)
		end

		def coord_results
			@_coords ||= LocationService.get_coords(@location)
		end

end