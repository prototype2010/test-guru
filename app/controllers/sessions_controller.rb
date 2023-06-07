class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Are really guru ? Check email and password'
      render :new
    end
  end

  def logout
    reset_session

    redirect_to signin_path, alert: 'Logged out successfully'
  end
end
