class Order < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :menu_item_orders

  has_many :menu_items, through: :menu_item_orders, dependent: :destroy

	# Create a new Postmates client
	@@postmates_client = Postmates.new

	# Set basic config variables
	@@postmates_client.configure do |config|
	  config.api_key = ENV['POSTMATES_ENV_KEY']
	  config.customer_id = ENV['POSTMATES_CUSTOMER_KEY']
	end

	def self.postmates_client
		@@postmates_client
	end

end
