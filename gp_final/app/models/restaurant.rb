class Restaurant < ApplicationRecord
  has_many :orders
  has_many :ratings, through: :orders
  has_many :menu_items
  has_many :users



  def full_address
  	"#{address} #{city} #{state} #{zipcode}"
  end 

def self.search(search)
  where("name LIKE ? OR description LIKE ? OR zipcode LIKE ? OR category LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end

def to_json
        "{'id': #{id}, 'longitude': #{longitude}, 'latitude': #{latitude}}"
    end
    def to_h
        {
            id: id,
            lng: longitude.to_f,
            lat: latitude.to_f
        }
    end




geocoded_by :address       # can also be an IP address
 after_validation :geocode  # auto-fetch coordinates

end
