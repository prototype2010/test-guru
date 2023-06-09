class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  def authenticate_user!
    return if current_user

    cookies[:redirect_path] = request.path
    redirect_to new_session_path, alert: 'Sing in required for this path'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
