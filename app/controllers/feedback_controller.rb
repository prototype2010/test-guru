class FeedbackController < ApplicationController
  def new;end

  def create
    render 'feedback_successful'
  end

  def feedback_successful;end

  private

  def feedback_params
    params.require(:feedback).permit(:body)
  end
end
