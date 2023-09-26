class Booking < ApplicationRecord
  has_many :refunds
  belongs_to :customer
  belongs_to :event
  

  validates :order_number, presence: true, uniqueness: true

  before_validation :generate_order_number

  after_create :update_event_sit_count

  def update_event_sit_count
    event.update(remaining_sits: event.total_sits - no_of_tickets)
  end

  def generate_order_number
    self.order_number = "BOOKING-#{SecureRandom.hex(5).upcase}"
  end
end
