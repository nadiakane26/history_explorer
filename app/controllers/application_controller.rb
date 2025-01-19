class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to regions_path  # Redirect to a suitable page (e.g., the regions index)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :username ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :first_name, :last_name, :username ])
  end
end
