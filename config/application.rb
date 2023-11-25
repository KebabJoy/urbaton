require_relative "boot"
require_relative "../app/middlewares/snake_case_params_middleware"

require "rails/all"
require 'oj'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Urbaton
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.api_only = true

    config.middleware.use SnakeCaseParamsMiddleware

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '/*', headers: :any, methods: [:patch, :post, :get, :put]
      end
    end

    config.paths["config/routes.rb"] << Rails.root.join("config/routes/web/v1.rb")

    config.generators do |g|
      g.factory_bot dir: 'spec/factories'
    end

    config.generators do |g|
      g.test_framework :rspec
    end
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
