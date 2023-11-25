# frozen_string_literal: true

module FeedsContext
  module AsManager
    class GetFeeds < BaseQuery
      def initialize
        super { FeedsContext::Feed.pending }
      end

      def find_complaint_by_id(collection, id:)
        collection.find(id)
      end
    end
  end
end
