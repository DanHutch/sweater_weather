class DailySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :time, :summary

  attributes :url do |object|
    object.gif_url
  end

end
