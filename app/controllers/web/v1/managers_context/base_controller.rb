# frozen_string_literal: true

module Web
  module V1
    module ManagersContext
      class BaseController < Web::V1::BaseController
        include RoleAuthorized

        def self.inherited(klass)
          klass.define_method(:resource) do
            Manager
          end
        end
      end
    end
  end
end
