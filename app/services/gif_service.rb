class GifService

  def get_gif(summary)
    data = get_json("/v1/gifs/search?q=#{summary}&api_key=#{ENV['GIPHY_API_KEY']}")
  end

  private

    def get_json(url)
      response = conn.get(url)
      parsed = JSON.parse(response.body, symbolize_names: true)
    end

		def conn
			Faraday.new(url: "http://api.giphy.com") do |faraday|
			faraday.adapter Faraday.default_adapter
			end
    end

end