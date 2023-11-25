# frozen_string_literal: true

require "swagger_helper"

describe "Feeds", type: :request do
  path "/as_manager/feeds" do
    get "Список клиентских новостей" do
      common_with_tags "Новости"

      parameter name: :authToken, in: :query, type: :string

      let!(:client) { create :client }
      let!(:manager) { create :manager }
      let!(:feed1) { create :complaint_feed, author: client, status: :pending }
      let!(:feed2) { create :complaint_feed, author: client, status: :published }

      success_response do
        schema type: :array, items: Swagger.read_definition("feed")

        let(:authToken) { manager.auth_token }

        run_test! do |response|
          expect(response.body).to be_json_eql(feed1.id.to_json).at_path("0/id")
        end
      end
    end

    post "Создать новость" do
      common_with_tags "Новости"

      parameter name: :authToken, in: :query, type: :string
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          title: {type: :string},
          body: {type: :string},
          pictureUrl: {type: :string},
        }
      }

      let!(:manager) { create :manager }
      let(:params) do
        {
          title: Faker::Games::Overwatch.hero,
          body: Faker::Games::Overwatch.hero,
          pictureUrl: "Jopa"
        }
      end

      created_response do
        schema type: :object, properties: { id: {type: :integer} }

        let(:authToken) { manager.auth_token }

        run_test!
      end
    end
  end
end
