# frozen_string_literal: true

module Web
  module V1
    module AdminsContext
      module Admins
        class SessionsController < AdminsContext::BaseController
          include Authorized
        end
      end
    end
  end
end
