module Api
  module V1
    class OrdersController < ApiController

      def index
        @orders = if params[:created_at_gte].present?
          created_at_gte = Time.zone.parse(params[:created_at_gte])
          Order.where("itime >= ?", created_at_gte)
        else
          Order.all
        end
      end

      def create
        @order = Order.new(order_params)
        if @order.order_number.empty?
          @order.order_number = (Order.last.order_number.to_i + 1).to_s
        end
        @order.save!
      end

      def show
        @order = if params[:order_number].present?
          Order.where("ordnumber = ?", params[:order_number]).first
        else
          Order.find(params[:id])
        end
      end

      def update
        @order = Order.find(params[:id])
        @order.update_attributes(order_params)
      end

      def destroy
        @order = Order.find(params[:id])
        @order.destroy
      end

      private
      
      def order_params
        # FIXME: might be dangerous to whitelist everything
        params.require(:order).permit!
      end
    end
  end
end