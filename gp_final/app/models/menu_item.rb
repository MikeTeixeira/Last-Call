class MenuItem < ApplicationRecord
  belongs_to :restaurant
  has_many :menu_item_orders, dependent: :destroy
  has_many :orders, through: :menu_item_orders

  enum category: ["Select entree type", :Appetizer, :Lunch, :Dinner]
  enum status: [:Regular, :Sale]

end
