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

  def is_refundable?
    event.start_date > Date.today
  end

  def self.ransackable_attributes(auth_object = nil)
    ["amount_paid", "created_at", "customer_id", "event_id", "id", "no_of_tickets", "order_number", "stripe_transaction_id", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["customer", "event", "refunds"]
  end
end
