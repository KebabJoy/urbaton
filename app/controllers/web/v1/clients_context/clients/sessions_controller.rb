# frozen_string_literal: true

module Web
  module V1
    module ClientsContext
      module Clients
        class SessionsController < ClientsContext::BaseController
          include Authorized
        end
      end
    end
  end
end
