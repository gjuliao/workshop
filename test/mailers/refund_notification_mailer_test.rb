require "test_helper"

class RefundNotificationMailerTest < ActionMailer::TestCase
  test "customer_refund_notification" do
    mail = RefundNotificationMailer.customer_refund_notification
    assert_equal "Customer refund notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "admin_refund_notification" do
    mail = RefundNotificationMailer.admin_refund_notification
    assert_equal "Admin refund notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
