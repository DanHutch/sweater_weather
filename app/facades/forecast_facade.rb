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
    serialized = ForecastSerializer.new(forecast)
  end

  def self.dailies_with_gifs(location)
    new(location).dailies_with_gifs
  end

  def dailies_with_gifs
    place_data = coord_results
    forecast = Forecast.new(weather_results(place_data[:coords]), place_data)
    forecast.dailies.each do |daily|
      @daily_gifs << Daily.with_gif(daily)
    end
#binding.pry
    serialized = DailySerializer.new(forecast.dailies)
  end

  private

    def weather_results(coords)
      @_weather ||= WeatherService.get_weather(coords)
    end

    def coord_results
      @_coords ||= LocationService.get_coords(@location)
    end

end