module Api
  module V1
    class ApiController < ApplicationController
      
      include ActionController::HttpAuthentication::Basic::ControllerMethods
      before_action :authenticate
      
      private
      
      def authenticate
        authenticate_with_http_basic do |username, password|
          true # username == ENV['HTTP_USERNAME'] && password == ENV['HTTP_PASSWORD']
        end
      end
      
    end
  end
end