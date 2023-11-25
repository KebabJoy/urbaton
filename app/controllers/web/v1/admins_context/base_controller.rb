# frozen_string_literal: true

module Web
  module V1
    module AdminsContext
      class BaseController < Web::V1::BaseController
        include RoleAuthorized

        def resource
          Admin
        end
      end
    end
  end
end
