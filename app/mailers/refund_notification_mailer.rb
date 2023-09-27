class RefundNotificationMailer < ApplicationMailer

 
  def customer_refund_notification(refund)
    @refund = refund
    @booking = refund.booking
    @customer = refund.customer
    @event = @booking.event
    @refundable_amount = @refund.no_of_tickets * @event.registration_fee
    mail to: @customer.email, subject: "Refund accepeted for #{@event.name}."
  end

 
  def admin_refund_notification(refund)
    @refund = refund
    @booking = refund.booking
    @customer = refund.customer
    @event = @booking.event
    @refundable_amount = @refund.no_of_tickets * @event.registration_fee
    mail to: AdminUser.first.email, subject: "Refund request coming for #{@event.name}."
  end
end
