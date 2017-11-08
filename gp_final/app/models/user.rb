class User < ApplicationRecord
  validates :f_name, :presence => true
  validates :l_name, :presence => true
  validates :admin, :presence => true
  validates :email, :presence => true
  validates :username, :presence => true
  validates :password, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :ratings, through: :orders
  has_many :admins
  has_many :restaurants, through: :admins

  enum role: [:user, :admin]

end
