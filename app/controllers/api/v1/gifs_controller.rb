module Api
  module V1
		class GifsController < ApplicationController

			def index
        render json: ForecastFacade.dailies_with_gifs(params["location"])
			end

		end
	end
end