class Api::V1::ApplicationController < ActionController::API
  before_action :authenticate_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def after_sign_out_path_for(_scope)
    new_user_session_path
  end

  protected

  def authenticate_user
    header = request.headers['Authorization']
    header = header.split.last if header
    decoded_token = JWT.decode header, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' }
    payload = decoded_token[0]
    @auth_user = User.find(payload['id']) if payload && payload['id']
  rescue JWT::VerificationError
    render json: {
      msg: 'Invalid Token'
    }
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :password, :password_confirmation])
  end
end