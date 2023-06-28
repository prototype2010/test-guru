class FeedbackMailer < ApplicationMailer
  def feedback_sent(feedback_text, current_user)
    @user = current_user
    @feedback_text = feedback_text

    User.where(type: 'Admin').each do |admin|
      mail to: admin.email
    end
  end
end
