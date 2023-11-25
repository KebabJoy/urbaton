# frozen_string_literal: true

module FeedsContext
  class NewsFeed < Feed
    belongs_to :author, class_name: 'Manager'
  end
end
