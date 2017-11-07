class Restaurant < ApplicationRecord
  belongs_to :rating
  belongs_to :menu_item
end
