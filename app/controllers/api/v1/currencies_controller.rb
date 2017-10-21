module Api
  module V1
    class CurrenciesController < ApiController

      def index
        @currencies = Currency.all
      end

    end
  end
end