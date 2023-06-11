class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(resource)
    override_welcome_message(resource)

    if resource.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end

  def override_welcome_message(resource)
    flash[:notice] = if resource.first_name.present?
                       "Hi, #{resource.first_name} #{resource.last_name}"
                     else
                       "Hi, #{resource.email}"
                     end
  end
end
