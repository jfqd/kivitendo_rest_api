module Api
  module V1
    class ProductsController < ApiController

      def index
        @products = if params[:created_at_gte].present?
          created_at_gte = Time.zone.parse(params[:created_at_gte])
          Product.find(:all, :conditions => ["created_at >= ?", created_at_gte])
        else
          Product.all
        end
      end

      def create
        @product = Product.new(product_params)
        @product.save!
      end

      def show
        @product = Product.find(params[:id])
      end

      def update
        @product = Product.find(params[:id])
        @product.update_attributes(product_params)
      end

      def destroy
        @product = Product.find(params[:id])
        @product.destroy
      end

      private
      
      def product_params
        # FIXME: might be dangerous to whitelist everything
        params.require(:product).permit!
      end
    end
  end
end