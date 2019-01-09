class ApplicationController < ActionController::API

  def current_user
    User.find_by(api_key: params[:api_key])
  end

  def authenticate_user
    unless current_user
       render json: "Unauthorized", status: 401
    end
  end

  def validate_password
    unless params[:password] == params[:password_confirmation]
      render json: "Something went wrong!", status: 422
    end
  end

end
