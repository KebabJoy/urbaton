# frozen_string_literal: true

require "swagger_helper"

describe "Bank Accounts", type: :request do
  path "/admins/sessions" do
    get "Информация о админе" do
      common_with_tags "Пользователи"

      parameter name: :authToken, in: :query, type: :string

      let!(:admin) { create :admin }

      success_response do
        schema Swagger.read_definition("user")

        let(:authToken) { admin.auth_token }

        run_test! do |response|
          expect(response.body).to be_json_eql(admin.id.to_json).at_path("id")
        end
      end
    end
  end
end
