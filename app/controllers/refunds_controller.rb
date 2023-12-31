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
        refundable_amount = params[:refund][:no_of_tickets].to_i * @event.registration_fee
        if @refund.update(no_of_tickets: params[:refund][:no_of_tickets])
            RefundNotificationMailer.customer_refund_notification(@refund).deliver_now
            RefundNotificationMailer.admin_refund_notification(@refund).deliver_now
            redirect_to refund_acceptance_refund_path, notice: "You are eligible for refund with vale $#{refundable_amount.to_f}."
        else
            redirect_to refund_acceptance_refund_path, alert: 'Something went wrong'
        end
    rescue StandardError => error
        redirect_to refund_acceptance_refund_path, alert: error.message

    end

    def refund_acceptance
        @accepted_refunds = Refund.accepted_refunds_for_booking(@booking.id)
        @succesful_refunds = Refund.succesful_refunds_for_booking(@booking.id)
    end

    private

    def set_refund_with_parents
        @refund = Refund.find(params[:id])
        @booking = @refund.booking
        @event = @booking.event
    end
end