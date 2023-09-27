class Refund < ApplicationRecord
  belongs_to :customer
  belongs_to :booking

  scope :accepted_refunds_for_booking, -> (booking_id) { where(state: 'accepted', booking_id: booking_id) }
  scope :succesful_refunds_for_booking, -> (booking_id) { where(state: 'success', booking_id: booking_id) }
  scope :rejectd_refunds_for_booking, -> (booking_id) { where(state: 'rejected', booking_id: booking_id) }

  def amount_to_be_refunded
    no_of_tickets.to_i * booking.event.registration_fee
  end

  def remaining_tickets_for_refund
    booking.no_of_tickets - no_of_tickets
  end

  def remaining_amount_for_refund
    remaining_tickets_for_refund * ticket_fee
  end

  def ticket_fee
    booking.event.registration_fee
  end

  def eligible_refundable_sits
    booking.no_of_tickets - Refund.where(state: 'accepted', booking_id: booking_id).where.not(id: id).pluck(:no_of_tickets).sum
  end
end
