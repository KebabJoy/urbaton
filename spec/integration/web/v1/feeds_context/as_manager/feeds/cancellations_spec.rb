# frozen_string_literal: true

require "swagger_helper"

describe "Feeds", type: :request do
  path "/as_manager/feeds/{feedId}/cancellations" do
    post "Отказать в жалобе" do
      common_with_tags "Новости"

      parameter name: :authToken, in: :query, type: :string
      parameter name: :feedId, in: :path, type: :integer

      let!(:client) { create :client }
      let!(:manager) { create :manager }
      let!(:feed) { create :complaint_feed, author: client, status: :pending }
      let!(:feedId) { feed.id }

      created_response do
        schema type: :object, properties: { id: {type: :integer} }

        let(:authToken) { manager.auth_token }

        run_test! do |response|
          expect(response.body).to be_json_eql(feed.id.to_json).at_path("id")
        end
      end

      forbidden_response do
        let(:authToken) { client.auth_token }

        run_test!
      end
    end
  end
end
