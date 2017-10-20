module Api
  module V1
    class CustomersController < ApiController

      def index
        @customers = if params[:created_at_gte].present?
          created_at_gte = Time.zone.parse(params[:created_at_gte])
          Customer.find(:all, :conditions => ["created_at >= ?", created_at_gte])
        else
          Customer.all
        end
      end

      def create
      end

      def show
        @customer = Customer.find(params[:id])
      end

      def update
      end

      def update
      end

      def destroy
      end

    end
  end
end