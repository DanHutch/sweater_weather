module Api
  module V1
    class FavoritesController < ApplicationController

      def create
        if current_user
          new_fav = current_user.add_fav(fav_params)
          render json: FavSerializer.new(new_fav), status: 201
        else
          render json: "Unauthorized", status: 401
        end
      end

      private

      def fav_params
        params.permit(:location)
      end

    end
  end
end