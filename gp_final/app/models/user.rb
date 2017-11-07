class User < ApplicationRecord
  has_many :orders
  has_many :ratings, through: :orders
  has_many :admins
  has_many :restaurants, through: :admins
end
