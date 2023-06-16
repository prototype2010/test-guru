class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_sign_in_params, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    return {} if request.params[:locale] == I18n.locale

    { locale: I18n.locale }
  end

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

  def set_locale
    I18n.locale = I18n.locale_available?(params[:locale]) ? params[:locale] : I18n.default_locale
  end
end
