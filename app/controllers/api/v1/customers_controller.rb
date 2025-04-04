module Api
  module V1
    class CustomersController < ApiController

      def index
        @customers = if params[:created_at_gte].present?
          created_at_gte = Time.zone.parse(params[:created_at_gte])
          Customer.where("itime >= ?", created_at_gte)
        elsif params[:email].present?
          customer = Customer.where(email: params[:email], obsolete: false) rescue nil
          if customer.blank?
            c = Contact.where(cp_email: params[:email]) rescue nil
            customer = Customer.where(id: c.first.cp_cv_id, obsolete: false) if c.try(:first).present?
          end
          customer
        else
          Customer.all
        end
      end

      def create
        @customer = Customer.new(customer_params)
        @customer.save!
      end

      def show
        @customer = Customer.where(id: params[:id], obsolete: false).try(:first)
      end

      def update
        @customer = Customer.find(params[:id])
        @customer.update(customer_params)
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