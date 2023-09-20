class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :event

  after_create :update_event_sit_count

  def update_event_sit_count
    event.update(remaining_sits: event.total_sits - no_of_tickets)
  end
end
