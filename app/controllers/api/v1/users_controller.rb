
class Api::V1::UsersController < ApplicationController
  before_action :validate_password, only: [:create]

  def create
    @user = User.new(user_params)
    attempt_save_user(@user)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def attempt_save_user(user)
    if user.save
      render json: UserKeySerializer.new(@user), status: 201
    else
      render json: "Something went wrong!", status: 422
    end
  end

end