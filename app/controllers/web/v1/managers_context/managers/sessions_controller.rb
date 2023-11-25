# frozen_string_literal: true

module Web
  module V1
    module ClientsContext
      module Managers
        class SessionsController < BaseController
          include Authorized
        end
      end
    end
  end
end
