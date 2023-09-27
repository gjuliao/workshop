class Admin::BookingsController < AdminController
    before_action :set_booking_with_parents, only: %i[show]

    def index
        @q = Booking.ransack(params[:q])
        @bookings = @q.result.includes(:customer, :event)
    end

    def show
    end

    private

    def set_booking_with_parents
        @booking = Booking.find(params[:id])
        @customer = @booking.customer
        @event = @booking.event
    end
end