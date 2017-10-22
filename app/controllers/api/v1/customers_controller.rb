module Api
  module V1
    class CustomersController < ApiController

      def index
        @customers = if params[:created_at_gte].present?
          created_at_gte = Time.zone.parse(params[:created_at_gte])
          Customer.where("itime >= ?", created_at_gte)
        elsif params[:email].present?
          Customer.where(email: params[:email])
        else
          Customer.all
        end
      end

      def create
        @customer = Customer.new(customer_params)
        @customer.save!
      end

      def show
        @customer = Customer.find(params[:id])
      end

      def update
        @customer = Customer.find(params[:id])
        @customer.update_attributes(customer_params)
      end

      def destroy
        @customer = Customer.find(params[:id])
        @customer.destroy
      end

      private
      
      def customer_params
        # FIXME: might be dangerous to whitelist everything
        params.require(:customer).permit!
      end
    end
  end
end