FactoryBot.define do
  factory :complaint_feed, class: FeedsContext::ComplaintFeed do
    title { Faker::ElectricalComponents.electromechanical }
    body { Faker::Games::Overwatch.hero }
  end

  factory :news_feed, class: FeedsContext::NewsFeed do
    title { Faker::ElectricalComponents.electromechanical }
    body { Faker::Games::Overwatch.hero }
  end
end
