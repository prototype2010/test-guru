class FeedbackController < ApplicationController
  def new;end

  def create
    FeedbackMailer.feedback_sent(params[:body], current_user).deliver_now

    render 'feedback_successful'
  end

  def feedback_successful;end
end
