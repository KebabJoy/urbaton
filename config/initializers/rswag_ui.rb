# frozen_string_literal: true

Rswag::Ui.configure do |c|
  c.swagger_endpoint "/api-docs/web/v1.yaml", "Web API"

  c.config_object[:deepLinking] = true
  c.config_object[:filter] = true
end
