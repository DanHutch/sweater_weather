class DailySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id

# binding.pry
  # attributes :time do |object|
  #   object.dailies.each do |daily|
  #     binding.pry
  #   end
  # end

end
