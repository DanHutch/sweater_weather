class Daily
  require 'securerandom'

  attr_reader :time,
              :summary,
              :gif_url

  def initialize(data_in)
    @time = data_in[:time].to_s
    @summary = data_in[:summary]
    @url = nil
  end

  def self.with_gif(init_data)
    new(init_data).set_gif
  end

  def set_gif
    @url = gif_results[:data].first[:images][:downsized][:url]
    return self
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