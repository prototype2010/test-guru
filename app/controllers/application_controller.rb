class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_sign_in_params, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
