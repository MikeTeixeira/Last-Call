class Restaurant < ApplicationRecord
  has_many :orders
  has_many :ratings, through: :orders
  has_many :menu_items
end
