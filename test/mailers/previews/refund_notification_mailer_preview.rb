# Preview all emails at http://localhost:3000/rails/mailers/refund_notification_mailer
class RefundNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/refund_notification_mailer/customer_refund_notification
  def customer_refund_notification
    RefundNotificationMailer.customer_refund_notification
  end

  # Preview this email at http://localhost:3000/rails/mailers/refund_notification_mailer/admin_refund_notification
  def admin_refund_notification
    RefundNotificationMailer.admin_refund_notification
  end

end
