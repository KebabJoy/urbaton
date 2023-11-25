# frozen_string_literal: true

module Authorized
  extend ActiveSupport::Concern

  included do
    skip_before_action :authorize!
    skip_before_action :authorize_role
  end

  def show
    not_found unless current_member
  end

  def sign_in
    @current_member = resource.find_by(email: sign_in_params[:email], password: sign_in_params[:password])

    not_found unless @current_member
  end

  def sign_up
    @current_member = resource.new(user_params)
    @current_member.setup_token

    unless @current_member.save
      render_unprocessable_entity(@current_member)
    end
  end

  private

  def user_params
    params.permit(:email, :first_name, :last_name, :password)
  end

  def update_params
    params.permit(:email, :first_name, :last_name, :password, :bio, :age)
  end

  def sign_in_params
    @sign_in_params ||= params.permit(:email, :password)
  end

  def not_found(message = "Not Found")
    render json: { success: false, message: message }, status: :not_found
  end

  def resource
    User
  end
end
