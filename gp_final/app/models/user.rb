class User < ApplicationRecord
  has_many :orders
  has_many :restaurants, through: :orders
  has_many :ratings, through: :orders
end
