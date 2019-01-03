module Api
  module V1
		class ForecastController < ApplicationController

			def show
				#render this as json later!
				@facade = ForecastFacade.forecast(params["location"])
			end

		end
	end
end