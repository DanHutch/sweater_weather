class Api::V1::FavoritesController < ApplicationController
  before_action :authenticate_user

  def index
    render json: FavsWithForecastsSerializer.new(fav_locations), status: 200
  end

  def create
    render json: FavSerializer.new(new_fav), status: 201
  end

  def destroy
    render json: FavSerializer.new(fav_destroy)
  end

  private

  def new_fav
    current_user.add_fav(fav_params)
  end

  def fav_destroy
    current_user.destroy_fav(fav_params)
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