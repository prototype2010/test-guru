require "test_helper"

class FeedbackMailerTest < ActionMailer::TestCase
  test "feedbacksent" do
    mail = FeedbackMailer.feedbacksent
    assert_equal "Feedbacksent", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
