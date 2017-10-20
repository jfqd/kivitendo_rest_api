module Api
  module V1
    class ApiController < ApplicationController

      include ActionController::HttpAuthentication::Basic::ControllerMethods

      http_basic_authenticate_with name: Rails.application.secrets[:http_user],
                               password: Rails.application.secrets[:http_pwd]

    end
  end
end