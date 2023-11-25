# frozen_string_literal: true

module Web
  module V1
    module FeedsContext
      module AsManager
        class FeedsController < ManagersContext::BaseController
          def index
            @feeds =
              ::FeedsContext::AsManager::GetFeeds.new.call(
                :all,
                preloaders: -> (val) { val.includes(:author) }
              )
          end

          def create
            @feed = current_member.authored_news_feeds.create!(**create_params.merge(status: :published))

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
