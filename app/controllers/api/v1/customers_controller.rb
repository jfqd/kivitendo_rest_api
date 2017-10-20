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
        params.require(:customer).permit(
          :name, :street, :zipcode, :city, :country, :phone, :fax, :homepage, :email, :notes, 
          contacts_attributes: [:id, :title, :fist_name, :last_name]
        )
      end
    end
  end
end