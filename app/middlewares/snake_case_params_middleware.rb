# frozen_string_literal: true

class SnakeCaseParamsMiddleware
  UUID_REGEXP = /^[\da-f]{8}-([\da-f]{4}-){3}[\da-f]{12}\z/i

  def initialize(app)
    @app = app
  end

  def call(env)
    request = ActionDispatch::Request.new(env)

    request.request_parameters.deep_transform_keys! { _1.match(UUID_REGEXP) ? _1 : _1.underscore }
    request.query_parameters.deep_transform_keys! { _1.match(UUID_REGEXP) ? _1 : _1.underscore }

    @app.call(env)
  end
end
