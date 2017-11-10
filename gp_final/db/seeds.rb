# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([ { 
	id: 1, 
	f_name: "Joan", 
	l_name:"Borbon", 
	email:"jborbon@live.com", 
	username:"jborbon", 
	password: "test123",
	admin: true
	}, { 
	id: 2,
	f_name: "Christy", 
	l_name:"Kusuma" , 
	email:"ckusuma@bu.edu", 
	username:"ckusuma", 
	password: "test123",
	admin: true
	}, { 
	id: 3, 
	f_name: "Michael", 
	l_name:"Telxelra", 
	email:"Mt@gmail.com", 
	username:"MichaelT", 
	password: "test123",
	admin: true
	} ])

Restaurant.create!([ {
	id: 1,
	name: "Poke bowl", 
	description: "the best food spot ever", 
	category: 0, 
	phone_number:"(646)371-9773", 
	address: "104 fulton st",
	state: "ny", 
	city:"Manhattan", 
	zipcode: '10038',
	longitude: "-74.006835",
    	latitude: "40.709556" ,
	open_hours: "8", 
	close_hours: "9",
	user_id: 3 
	}, {
	id: 2, 
	name: "Jubulee", 
	description: "One stop shop", 
	category: 5, 
	phone_number: "(212)233-0808", 
	address: "99 john st",
	state: "ny", 
	city:"corona", 
	zipcode: '12038', 
	longitude: "-74.006001",
   	 latitude: "40.708308",
	open_hours: "6" , 
	close_hours:"7",
	user_id: 3 
	}, {
	id: 3, 
	name:"thai sliders & co", 
	description: "yummy in your tummy", 
	category: 6, 
	phone_number: "(212)406-4773", 
	address:"108 john st",
	state: "ny", 
	city:"downtown", 
	zipcode: '10038', 
	longitude: "-73.681358",
    	latitude: "41.096579" ,
	open_hours: "5", 
	close_hours:"6",
	user_id: 3 
	} ])

Order.create!([ {
	id: 1,
	user_id: 1, 
	restaurant_id: 1, 
	pickup_address: "90 john st",
	pickup_phone_number: "(212)555-1234", 
	pickup_business_name:"Poke bowl", 
	dropoff_name: "Cam Crew", 
	dropoff_address:"90 john street" , 
	dropoff_phone_number: "(718)123-4556", 
	dropoff_business_name:"NYCDA", 
	dropoff_notes: "Do not eat my food !"
	}, {
	id: 2, 
	user_id: 2, 
	restaurant_id: 2,
	pickup_address: "103-02 10st", 
	pickup_phone_number:"(212)555-4567", 
	pickup_business_name:"Jubulee", 
	dropoff_name: "Christy", 
	dropoff_address: "20 crew blvd", 
	dropoff_phone_number: "(718)123-4556", 
	dropoff_business_name:"NYCDA", 
	dropoff_notes: "Do not eat my food !"
	}, {
	id: 3, 
	user_id: 3, 
	restaurant_id: 3, 
	pickup_address: "90 john st", 
	pickup_phone_number: "(212)555-1234", 
	pickup_business_name: "Poke bowl", 
	dropoff_name: "Cam Crew", 
	dropoff_address: "20", 
	dropoff_phone_number: "(718)789-4556", 
	dropoff_business_name:"Toyota", 
	dropoff_notes: "Do not eat my food !"
	} ])



Rating.create!([ {
	id: 1, 
	order_id: 1,
	review: "best evaaaa", 
	restaurant_rating: 4  
	}, {
	id: 2, 
	order_id: 2,
	review: "ughh gross", 
	restaurant_rating: 1 
	}, {
	id: 3,
	order_id: 3,
	review: "inexpensive and good",
	restaurant_rating: 5 
	} ])

MenuItem.create!([ {
	id: 1,
	restaurant_id: 1, 
	name:"chicken bowl", 
	category:8, 
	price: 12.00, 
	description:"chicken and rice in a bowl"
	}, {
	id: 2, 
	restaurant_id: 1, 
	name: "beef bowl", 
	category: 8, 
	price: 12.00, 
	description:"beef and rice in a bowl"
	}, {
	id: 3,
	restaurant_id: 1, 
	name: "tuna bowl", 
	category: 8, 
	price: 12.00, 
	description: "tuna and rice in a bowl"},
	{
	id: 4,
	restaurant_id: 2, 
	name: "beef stew", 
	category: 9, 
	price: 10.00, 
	description: "beef in stew"
	}, {
	id: 5,
	restaurant_id: 3, 
	name: "pork thai slider", 
	category: 10, 
	price: 5.00, 
	description: "pork in ginger sauce on a bun"
	} ])

MenuItemOrder.create!([ {
	id: 1,
	order_id: 1, 
	menu_item_id: 1, 
	quantity: 1
	}, {
	id: 2,
	order_id: 1, 
	menu_item_id: 2, 
	quantity: 1
	}, {
	id: 3, 
	order_id: 2, 
	menu_item_id: 2, 
	quantity: 1
	}, {
	id: 4,
	order_id: 3, 
	menu_item_id: 3, 
	quantity: 1
	} ])
