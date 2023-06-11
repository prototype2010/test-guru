class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    flash[:alert] = 'You singed in '
    if resource.is_a?(Admin)
      admin_tests_path
    else
      root_path
    end
  end
end
