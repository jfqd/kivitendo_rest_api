module Api
  module V1
    class PaymentTermsController < ApiController

      def index
        @payment_terms = PaymentTerm.all
      end

    end
  end
end