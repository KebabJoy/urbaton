# frozen_string_literal: true

module RoleAuthorized
  extend ActiveSupport::Concern

  included do
    before_action :authorize_role
  end

  private

  def authorize_role
    render_unauthorized unless current_member.is_a?(resource)
  end
end
