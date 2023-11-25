# frozen_string_literal: true

class Manager < User
  has_many :moderated_complaints, class_name: 'FeedsContext::ComplaintFeed', foreign_key: :manager_id
  has_many :authored_news_feeds, class_name: 'FeedsContext::NewsFeed', foreign_key: :author_id
end
