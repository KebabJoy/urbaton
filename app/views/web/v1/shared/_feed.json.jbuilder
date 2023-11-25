json.call(feed, :id, :title, :body, :status, :picture_url, :type)

json.author do
  json.full_name feed.author.full_name
  json.email feed.author.email
  json.phone feed.author.phone
end
