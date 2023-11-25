# frozen_string_literal: true

require "swagger_helper"

describe "Managers sessions", type: :request do
  path "/managers/sessions" do
    get "Информация о менеджере" do
      common_with_tags "Пользователи"

      parameter name: :authToken, in: :query, type: :string

      let!(:manager) { create :manager }

      success_response do
        schema Swagger.read_definition("user")

        let(:authToken) { manager.auth_token }

        run_test! do |response|
          expect(response.body).to be_json_eql(manager.id.to_json).at_path("id")
        end
      end
    end
  end

  path "/managers/sessions/sign_up" do
    post "Зарегать менеджера" do
      common_with_tags "Пользователи"

      parameter name: :params,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    firstName: {type: :string},
                    lastName: {type: :string},
                    middleName: {type: :string},
                    password: {type: :string},
                    email: {type: :string},
                    district: {type: :string}
                  }
                }

      let(:params) do
        {
          firstName: Faker::Games::Minecraft.achievement,
          lastName: Faker::Games::Minecraft.achievement,
          middleName: Faker::Games::Minecraft.achievement,
          password: Faker::Games::Minecraft.achievement,
          email: Faker::Games::Minecraft.achievement,
          district: Faker::Games::Minecraft.achievement,
          phone: Faker::Games::Minecraft.achievement
        }
      end

      success_response do
        schema Swagger.read_definition("user")

        run_test!
      end
    end
  end

  path "/managers/sessions/sign_in" do
    post "Войти" do
      common_with_tags "Пользователи"

      parameter name: :params,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    password: {type: :string},
                    email: {type: :string},
                  }
                }

      let!(:manager) { create :manager }
      let(:params) do
        {
          password: manager.password,
          email: manager.email
        }
      end

      success_response do
        schema Swagger.read_definition("user")

        run_test!
      end
    end
  end
end
