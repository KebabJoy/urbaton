# frozen_string_literal: true

module Web
  module V1
    module FeedsContext
      module AsClient
        class FeedsController < ClientsContext::BaseController
          def index
            @feeds =
              ::FeedsContext::AsClient::GetFeeds.new.call(
                :all,
                preloaders: -> (val) { val.includes(:author) }
              )
          end

          def create
            @feed = current_member.complaint_feeds.create!(**create_params)

            render_created(@feed)
          end

          private

          def create_params
            params.permit(:title, :body, :picture_url)
          end
        end
      end
    end
  end
end
