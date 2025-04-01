module Api
  module V1
    class OrdersController < ApiController

      def index
        @orders = if params[:created_at_gte].present?
          created_at_gte = Time.zone.parse(params[:created_at_gte])
          Order.where("itime >= ?", created_at_gte)
        elsif params[:order_number].present?
          Order.where("ordnumber = ?", params[:order_number])
        elsif params[:quote_number].present?
          Order.where("quonumber = ?", params[:quote_number])
        else
          Order.all
        end
      end

      def create
        @order = Order.new(order_params)
        if @order.present? && @order.order_number.blank? && @order.quote_number.blank?
          @order.order_number = get_next_order_number
        end
        @order.save!
      end

      def show
        Order.find(params[:id])
      end

      def update
        @order = Order.find(params[:id])
        @order.update(order_params)
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

      def get_next_order_number
        default = Default.first
        default.order_number = (default.order_number.to_i + 1).to_s
        default.save
        default.order_number
      end

    end
  end
end