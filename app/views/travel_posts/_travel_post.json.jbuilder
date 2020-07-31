json.extract! travel_post, :id, :title, :body, :created_at, :updated_at
json.url travel_post_url(travel_post, format: :json)
