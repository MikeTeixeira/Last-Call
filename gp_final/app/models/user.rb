class User < ApplicationRecord


  enum role: {user: 0, admin: 1}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :ratings, through: :orders
  has_many :admins
  has_many :restaurants, through: :admins

end
