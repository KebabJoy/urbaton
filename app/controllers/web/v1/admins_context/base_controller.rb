# frozen_string_literal: true

module Web
  module V1
    module AdminsContext
      class BaseController < Web::V1::BaseController
        include RoleAuthorized

        def self.inherited(klass)
          klass.define_method(:resource) do
            Admin
          end
        end
      end
    end
  end
end
