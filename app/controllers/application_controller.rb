class ApplicationController < ActionController::API

  def current_user
    User.find_by(api_key: params[:api_key])
  end

  def authenticate_user
    unless current_user
       render json: "Unauthorized", status: 401
    end
  end

end
