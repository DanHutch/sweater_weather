module Api
  module V1
		class ForecastController < ApplicationController

			def show
				location = params["location"]
				coords = coord_results(location)
				# render json: ForecastSerializer.new(data)
			end


			private

			def coord_results(place)
				@coords ||= service.get_coords(place)
			end

			def service
				LocationService.new
			end

		end
	end
end