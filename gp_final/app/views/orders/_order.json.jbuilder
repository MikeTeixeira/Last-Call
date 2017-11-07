json.extract! order, :id, :user_id, :restaurant_id, :image, :name, :description, :cost, :arrival, :created_at, :updated_at
json.url order_url(order, format: :json)
