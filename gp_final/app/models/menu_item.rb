class MenuItem < ApplicationRecord
  belongs_to :restaurant
  has_many :menu_item_orders
  has_many :orders, through: :menu_item_orders
end