# frozen_string_literal: true

class Client < User
  has_many :complaint_feeds, class_name: 'FeedsContext::ComplaintFeed', foreign_key: :author_id
end
