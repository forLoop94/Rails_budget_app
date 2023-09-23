class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  def after_sign_out_path_for(_resource_or_scope)
    welcome_page_index_path
  end

  def authenticate_user!
    return if user_signed_in?

    current_uri = request.env['PATH_INFO']
    unless [welcome_page_index_path, '/users/sign_in', '/users/sign_up', '/users/password/new',
            user_password_path, user_registration_path].include?(current_uri)
      redirect_to welcome_page_index_path
    end
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
