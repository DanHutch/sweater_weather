class Daily

  def initialize(data_in)
    binding.pry
    @time = Time.at(data_in[:time])
    @summary = data_in
  end

end