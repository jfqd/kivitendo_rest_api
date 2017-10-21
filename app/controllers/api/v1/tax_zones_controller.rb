module Api
  module V1
    class TaxZonesController < ApiController

      def index
        @tax_zones = TaxZone.all
      end

    end
  end
end