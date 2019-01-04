class Daily

  def initialize(data_in)
    @time = Time.at(data_in[:time])
    @summary = data_in[:summary]
    @gif_url = nil
  end

  def self.with_gif(init_data)
    new(init_data).set_gif
binding.pry
  end

  def set_gif
    @gif_url = gif_results[:data].first[:images][:downsized][:url]
binding.pry
  end

  private

  def gif_results
    gif_summary = @summary.gsub(" ", "+")
    service.get_gif(gif_summary)
  end

  def service
    GifService.new
  end

end