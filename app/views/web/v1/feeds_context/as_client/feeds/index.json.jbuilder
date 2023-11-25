json.array!(@feeds) do |feed|
  json.partial! "web/v1/feeds_context/shared/feeds", feed: feed
end
