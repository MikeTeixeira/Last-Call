json.extract! restaurant, :id, :rating_id, :menu_item_id, :name, :description, :phone_number, :location, :open_hours, :close_hours, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
