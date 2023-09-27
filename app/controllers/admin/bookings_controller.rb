class Admin::BookingsController < AdminController
    before_action :set_booking_with_parents, only: %i[show]

    private

    def set_booking_with_parents
        @booking = Booking.find(params[:id])
        @customer = @booking.customer
        @event = @booking.event
    end
end