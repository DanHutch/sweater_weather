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
    @forecast = Forecast.new(weather_results(place_data[:coords]), place_data)
    add_daily_forecasts(@forecast)
    serialized = DailySerializer.new(@forecast)
  end

  private

    def add_daily_forecasts(forecast)
      forecast.dailies.each do |daily|
        forecast.daily_forecasts << Daily.with_gif(daily)
      end
    end

    def weather_results(coords)
      @_weather ||= WeatherService.get_weather(coords)
    end

    def coord_results
      @_coords ||= LocationService.get_coords(@location)
    end

end