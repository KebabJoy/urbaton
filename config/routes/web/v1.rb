# frozen_string_literal: true

module ActionDispatch
  module Routing
    class Mapper
      def draw(routes_name)
        instance_eval(File.read(Rails.root.join("config", "routes", "web", "v1", "#{routes_name}.rb")))
      end
    end
  end
end

Rails.application.routes.draw do
  namespace :web do
    namespace :v1, defaults: {format: :json} do
      draw :clients_context
      draw :admins_context
      draw :managers_context
    end
  end
end
