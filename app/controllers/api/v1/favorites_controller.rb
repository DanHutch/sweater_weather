class Api::V1::FavoritesController < ApplicationController

  def index
    if current_user
      render json: FavsWithForecastsSerializer.new(fav_locations), status: 200
    else
      render json: "Unauthorized", status: 401
    end
  end

  def create
    if current_user
      render json: FavSerializer.new(new_fav), status: 201
    else
      render json: "Unauthorized", status: 401
    end
  end

  private

  def new_fav
    current_user.add_fav(fav_params)
  end

  def fav_locations
    current_user.favorites.map do |fav|
        ForecastFacade.weather(fav.location)
      end
  end

  def fav_params
    params.permit(:location)
  end

end