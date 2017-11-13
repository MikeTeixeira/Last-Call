class Restaurant < ApplicationRecord
  has_many :orders
  has_many :ratings, through: :orders
  has_many :menu_items
  has_many :users

has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def full_address
  	"#{address} #{city} #{state} #{zipcode}"
  end 

def self.search(search)
  where("name LIKE ? OR description LIKE ? OR zipcode LIKE ? OR category LIKE ? ", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
end

    def to_json
        "{'id': #{id}, 'longitude': #{longitude}, 'latitude': #{latitude}, 'name': #{name}}, 'address' : #{address}}, 'description' : #{description}, 'state' : #{state} , 'city' : #{city} , 'zipcode' : #{zipcode} , 'image' : #{image} "
    end
    def to_h
        {
            id: id,
            lng: longitude.to_f,
            lat: latitude.to_f,
            name: name,
            address: address,
            description: description,
            state: state,
            city: city ,
            zipcode: zipcode,
            image: image 

        }
    end




geocoded_by :address       # can also be an IP address
 after_validation :geocode  # auto-fetch coordinates

end
