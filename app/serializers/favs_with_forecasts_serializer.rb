class FavsWithForecastsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :location do |object|
    object.city + ", " + object.state
  end

  attributes :current_weather do |object|
    object
  end

end
