# frozen_string_literal: true

module FeedsContext
  class ComplaintFeed < Feed
    belongs_to :author, class_name: 'Client'
  end
end
