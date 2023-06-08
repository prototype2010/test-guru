class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?
  def authenticate_user!
    unless current_user
      cookies[:redirect_path] = request.path
      redirect_to signin_path, alert: 'Sing in required for this path'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
