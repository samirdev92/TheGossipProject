class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :sanitize_devise_params, if: :devise_controller?

  def sanitize_devise_params
    devise_parameter_sanitizer
      .permit(:sign_up, keys: %i[username anonymous_username])
  end

  def after_sign_in_path_for(_resource_or_scope)
    gossips_path
  end
end
