class Restaurant < ApplicationRecord
  has_many :users, through: :orders
  has_many :ratings, through: :orders
  has_many :menu_items
end
