class Daily
  require 'securerandom'

  attr_reader :id,
              :time,
              :summary,
              :gif_url

  def initialize(data_in)
    @id = SecureRandom.uuid
    @time = Time.at(data_in[:time])
    @summary = data_in[:summary]
    @gif_url = nil
  end

  def self.with_gif(init_data)
    new(init_data).set_gif
  end

  def set_gif
    @gif_url = gif_results[:data].first[:images][:downsized][:url]
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