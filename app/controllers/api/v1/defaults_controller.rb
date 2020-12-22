module Api
  module V1
    class DefaultsController < ApiController

      def show
        @default = Default.first
      end

      def update
        @default = Default.first
        @default.update_attributes(default_params)
      end

      private
      
      def default_params
        params.require(:default).permit!
      end
    end
  end
end