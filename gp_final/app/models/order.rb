class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
 
  has_many :menu_items, through: :menu_item_orders
end
