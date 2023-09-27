class Admin::RefundsController < AdminController
    before_action :set_refund

    def process_refund
    end

    private

    def set_refund
        @refund = Refund.find(params[:id])
    end
end