class RefundsController < ApplicationController
    before_action :set_refund_with_parents, only: %i[edit update refund_acceptance]

    def new
        @refund = Refund.new
    end

    def edit
        @refund = Refund.find(params[:id])
    end

    def create
       booking = Booking.find_by(order_number: params[:refund][:order_number])
       if booking.present?
        if booking.is_refundable?
            @refund = Refund.create(
                customer_id: booking.customer_id,
                booking_id: booking.id,
                state: 'accepted'
            )
            redirect_to edit_refund_path(@refund), notice: 'Your booking request is valid.  Please fill other details to process request.'
        else
            redirect_to new_refund_path, alert:'You are requesting for past workshop. Refunds are only allowed for future events.'
        end
       else
        redirect_to new_refund_path, alert: "You provided an invalid booking ID #{params[:refund][:order_number]}. No booking with this number."
       end
    end

    def update
    end

    def refunds_acceptance
    end

    private

    def set_refund_with_parents
        @refund = Refund.find(params[:id])
        @booking = @refund.booking
        @event = @booking.event
    end
end