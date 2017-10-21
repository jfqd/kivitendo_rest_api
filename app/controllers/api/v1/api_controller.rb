module Api
  module V1
    class ApiController < ApplicationController

      include ActionController::HttpAuthentication::Basic::ControllerMethods

      http_basic_authenticate_with name: Rails.application.secrets[:http_user],
                               password: Rails.application.secrets[:http_pwd]

      def self.default_api_time_format
       '%Y-%m-%d %H:%M'
      end

      def self.default_api_date_format
       '%Y-%m-%d'
      end

    end
  end
end