class DailySerializer
  include FastJsonapi::ObjectSerializer
  attributes :daily_forecasts, :copyright



end
