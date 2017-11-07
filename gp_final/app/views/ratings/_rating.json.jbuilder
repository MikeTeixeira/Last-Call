json.extract! rating, :id, :user_id, :restaurant_id, :review, :restaurant_rating, :created_at, :updated_at
json.url rating_url(rating, format: :json)
