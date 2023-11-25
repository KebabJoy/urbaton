# frozen_string_literal: true

module FeedsContext
  module AsClient
    class GetFeeds < BaseQuery
      def initialize
        super { FeedsContext::Feed.published }
      end

      def for_author(collection, author_id:)
        collection.where(author_id: author_id)
      end
    end
  end
end
