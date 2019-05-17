class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[firstname lastname bio age avatar email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[firstname lastname bio age avatar email password password_confirmation current_password])
  end
end
