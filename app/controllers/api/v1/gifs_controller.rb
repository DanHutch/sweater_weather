class Api::V1::GifsController < ApplicationController

  def index
    render json: ForecastFacade.dailies_with_gifs(params["location"])
  end

end
