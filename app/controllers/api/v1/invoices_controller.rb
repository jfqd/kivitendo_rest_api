module Api
  module V1
    class InvoicesController < ApiController

      def index
        @invoices = if params[:created_at_gte].present?
          created_at_gte = Time.zone.parse(params[:created_at_gte])
          Invoice.where("itime >= ?", created_at_gte)
        else
          Invoice.all
        end
      end

      def show
        @invoice = Invoice.find(params[:id])
      end

      private

      def invoice_params
        # FIXME: might be dangerous to whitelist everything
        params.require(:invoice).permit!
      end

    end
  end
end