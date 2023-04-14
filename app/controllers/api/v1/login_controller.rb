require 'jwt'
class Api::V1::LoginController < Api::V1::ApplicationController
  skip_before_action :authenticate_user
  def index
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      payload = {
        id: @user.id,
        name: @user.name,
        email: @user.email
      }
      token = JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
      render json: { token: }
    else
      render json: { name: 'wrong email or password' }
    end
  end
end
