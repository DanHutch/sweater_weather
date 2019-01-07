class Forecast
  attr_reader :id,
              :city,
              :state,
              :country,
              :latitude,
              :longitude,
              :summary,
              :current_temp,
              :feels_like,
              :humidity,
              :visibility,
              :uv_index,
              :high_temp,
              :low_temp,
              :date_time,
              :timezone,
              :hourly_summary,
              :daily_summary,
              :hourlies,
              :dailies,
              :copyright,
              :daily_forecasts

  def initialize(weather_data, location_data)
    @id = weather_data[:currently][:time]
    @city = location_data[:city]
    @state = location_data[:state]
    @country = location_data[:country]
    @latitude = location_data[:coords][:lat]
    @longitude = location_data[:coords][:lng]
    @summary = weather_data[:currently][:summary]
    @current_temp = weather_data[:currently][:temperature]
    @feels_like = weather_data[:currently][:apparentTemperature]
    @humidity = weather_data[:currently][:humidity]
    @visibility = weather_data[:currently][:visibility]
    @uv_index = weather_data[:currently][:uvIndex]
    @high_temp = weather_data[:daily][:data][0][:temperatureHigh]
    @low_temp = weather_data[:daily][:data][0][:temperatureLow]
    @date_time = Time.at(weather_data[:currently][:time])
    @timezone = weather_data[:timezone]
    @hourly_summary = weather_data[:hourly][:summary]
    @daily_summary = weather_data[:daily][:summary]
    @hourlies = weather_data[:hourly][:data]
    @dailies = weather_data[:daily][:data]
    @daily_forecasts = []
    @copyright = "2018"
  end

  def add_daily_forecast(daily_forecast)
    @daily_forecasts << daily_forecast
  end


end