# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  after_action :override_welcome_message, only: :create

  protected

  def override_welcome_message
    flash[:notice] = if current_user.first_name.present?
                       "Hi, #{current_user.first_name} #{current_user.last_name}"
                     else
                       "Hi, #{current_user.email}"
                     end
  end
end
