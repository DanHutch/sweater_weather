module Api
  module V1
    class UsersController < ApplicationController

      def create
        @user = User.new(user_params) if valid_password?
        if valid_password? && @user.save
          render json: UserKeySerializer.new(@user), status: 201
        else
          render json: "Something went wrong!", status: 422
        end
      end

      private

      def user_params
        params.permit(:email, :password)
      end

      def valid_password?
        params[:password] == params[:password_confirmation]
      end

    end
  end
end