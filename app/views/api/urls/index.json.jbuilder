# json.urls do
#   json.name @url.creator.name.familiar
#   json.email_address @message.creator.email_address_with_name
#   json.url url_for(@message.creator, format: :json)
# end

json.data @urls do |url| 
  # json.array! @urls do |url|
  #   json.url url.original_url
  # end
  json.type url.class.name
  json.id url.id
  json.attributes do
    json.created_at url.created_at
    json.original_url url.original_url
    json.url visit_url(url.short_url)
    json.clicks url.clicks.count
  end
end

