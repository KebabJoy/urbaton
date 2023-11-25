# frozen_string_literal: true

module Web
  module V1
    module ManagersContext
      module Managers
        class SessionsController < ManagersContext::BaseController
          include Authorized
        end
      end
    end
  end
end
