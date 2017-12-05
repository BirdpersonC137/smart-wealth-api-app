class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || user_dashboard_index_path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :date_of_birth, :password,
      :password_confirmation, :remember_me, :risk_profile) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :date_of_birth, :password,
      :password_confirmation, :current_password, :risk_profile) }
  end
end
