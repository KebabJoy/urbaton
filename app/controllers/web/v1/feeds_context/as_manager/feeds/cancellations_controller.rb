# frozen_string_literal: true

module Web
  module V1
    module FeedsContext
      module AsManager
        module Feeds
          class CancellationsController < ManagersContext::BaseController
            def create
              if feed.declined!
                render_created(@feed)
              else
                render_unprocessable_entity(@feed)
              end
            end

            private

            def feed
              @feed ||= ::FeedsContext::AsManager::GetFeeds.new.call(:find_complaint_by_id, id: params[:feed_id])
            end
          end
        end
      end
    end
  end
end
