json.array! @urls do |url|
  json.url url.youtube_url
  json.title url.title
  json.author url.author
  json.thumbnail url.thumbnail
  json.view url.view
end

