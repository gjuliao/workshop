class Admin::DashboardController < AdminController
    def index
        @event_count = Event.count 
        @upcoming_events_count = Event.upcoming_events.count
        @past_events_count = Event.past_events.count
        @customer_count = Customer.count
        @booking_count = Booking.count
        @revenue_earned = Booking.pluck(:amount_paid).sum

        @refundable_bookings = Booking.includes(:event).where('events.start_date >= ?', Date.today).references(:events)
        @active_refunds = Refund.includes(:booking).where('bookings.event_id IN (?) AND refunds.state = ?', Event.upcoming_events.ids, 'accepted').references(:booking)
    end
end