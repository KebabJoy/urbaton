# frozen_string_literal: true

module Web
  module V1
    class BaseController < ApplicationController
      include BaseRenderers

      before_action :authorize!

      # rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing
      rescue_from ActiveRecord::RecordNotFound, with: :not_found

      class << self
        def camelize_keys(bool, only: nil)
          define_method(:camelize_keys?) do
            if only.nil? || only.include?(action_name.to_sym)
              bool
            else
              super()
            end
          end
        end
      end

      def camelize_keys?
        true
      end

      private

      def handle_parameter_missing(exception)
        render json: { success: false, message: exception.message.capitalize }, status: 400
      end

      def authorize!
        render json: { success: false, message: 'Unauthorized' }, status: 403 unless current_member
      end

      def not_found(message = "Not Found")
        render json: { success: false, message: message }, status: :not_found
      end

      def current_member
        @current_member ||= resource.find_by(auth_token: params[:auth_token])
      end

      def page
        @page ||= params[:page] || 1
      end

      def per_page
        @per_page ||= params[:per_page] || 25
      end
    end
  end
end
