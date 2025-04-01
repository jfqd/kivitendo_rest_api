module Api
  module V1
    class CategoriesController < ApiController

      def index
        @categories = Category.all
      end

      def create
        @category = Category.new(category_params)
        @category.save!
      end

      def show
        @category = Category.find(params[:id])
      end

      def update
        @category = Category.find(params[:id])
        @category.update(category_params)
      end

      def destroy
        @category = Category.find(params[:id])
        @category.destroy
      end

      private
      
      def category_params
        # FIXME: might be dangerous to whitelist everything
        params.require(:category).permit!
      end
    end
  end
end