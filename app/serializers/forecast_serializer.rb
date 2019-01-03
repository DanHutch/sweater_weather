class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
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
              :dailies


end
