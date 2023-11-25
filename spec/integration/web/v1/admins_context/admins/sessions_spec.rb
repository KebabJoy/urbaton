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

  path "/admins/sessions/sign_up" do
    post "Зарегать админа" do
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

  path "/admins/sessions/sign_in" do
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

      let!(:admin) { create :admin }
      let(:params) do
        {
          password: admin.password,
          email: admin.email
        }
      end

      success_response do
        schema Swagger.read_definition("user")

        run_test!
      end
    end
  end
end
