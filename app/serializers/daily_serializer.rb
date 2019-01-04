class DailySerializer
  include FastJsonapi::ObjectSerializer
  attributes

  attributes :time do |object|
    object.dailies.each do |daily|
      binding.pry
    end
  end

end
