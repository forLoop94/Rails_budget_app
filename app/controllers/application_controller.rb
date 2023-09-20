class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end

  def authenticate_user!
    return if user_signed_in?

    current_uri = request.env['PATH_INFO']
    unless ['/users/sign_in', '/users/sign_up', '/users/password/new',
            user_password_path, user_registration_path].include?(current_uri)
      redirect_to new_user_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:name, :email, :password, :password_confirmation)
    end
  end
end
