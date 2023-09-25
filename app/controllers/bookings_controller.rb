class BookingsController < ApplicationController
    def create
    end 

    private 

    def customer_params
        params.permit(:full_name, :contact_number, :email)
    end

    def card_token_params
        params.permit(:card_number, :exp_month, :exp_year, :cvv)
    end
end