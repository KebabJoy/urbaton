# frozen_string_literal: true

module Web
  module V1
    module ClientsContext
      class BaseController < Web::V1::BaseController
        include RoleAuthorized

        def resource
          Client
        end
      end
    end
  end
end
