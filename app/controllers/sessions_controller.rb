class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_saved_path
    else
      flash.now[:alert] = 'Are really guru ? Check email and password'
      render :new
    end
  end

  def destroy
    reset_session

    redirect_to new_session_path, alert: 'Logged out successfully'
  end

  private

  def redirect_to_saved_path
    redirect_to cookies.delete(:redirect_path) || root_path
  end
end
