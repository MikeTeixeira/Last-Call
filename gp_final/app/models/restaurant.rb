class Restaurant < ApplicationRecord
  has_many :orders
  has_many :ratings, through: :orders
  has_many :menu_items
  has_many :admins
  has_many :users, through: :admins



  def full_address
  	"#{address} #{city} #{state} #{zipcode}"
  end 

def self.search(search)
  where("name LIKE ? OR description LIKE ? OR zipcode LIKE ? OR category LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end

end
