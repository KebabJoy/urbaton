# frozen_string_literal: true

class SwaggerDocsController < ApplicationController
  def show
    send_file "#{Rails.root}/swagger/#{params[:api]}/#{params[:version]}.yaml"
  end
end
