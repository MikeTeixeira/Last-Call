# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([ { 
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
	l_name:"Teixeira", 
	email:"mteixeira@gmail.com", 
	username:"mteixeira", 
	password: "test123",
	admin: true
	} ])

Restaurant.create!([ {
	id: 1,
	name: "Poke Bowl", 
	description: "Poke Bowl is a healthy Hawaiian fast food restaurant that offers a broad selection of freshly prepared raw fish or meat in a rice or salad bowl. To top it all of an assortment of mouthwatering toppings and sauces.", 
	category: 1, 
	phone_number:"646-371-9773", 
	address: "104 Fulton St",
	state: "NY", 
	city:"New York", 
	zipcode: '10038',
	longitude: "-74.006835",
    latitude: "40.709556" ,
	open_hours: "8:00", 
	close_hours: "9:00",
	user_id: 2,
	image: File.new('app/assets/images/photos/pokebowl.jpg')
	}, {
	id: 2, 
	name: "Jubilee Market Place", 
	description: "Specialty food market open around the clock for meats, produce & cheeses plus organic fare.", 
	category: 4, 
	phone_number: "212-233-0808", 
	address: "99 John St",
	state: "NY", 
	city:"New York", 
	zipcode: '10038', 
	longitude: "-74.006001",
   	latitude: "40.708308",
	open_hours: "6:00" , 
	close_hours:"7:00",
	user_id: 2 ,
	image: File.new('app/assets/images/photos/jubilee.png')
	}, {
	id: 3, 
	name:"Thai Sliders & Co.", 
	description: "Small burgers come with Asian spicing & are served with typical Thai dishes at this fusion venue.", 
	category: 2, 
	phone_number: "212-406-4773", 
	address:"108 John St",
	state: "NY", 
	city:"New York", 
	zipcode: '10038', 
	longitude: "-73.681358",
    latitude: "41.096579" ,
	open_hours: "5:00", 
	close_hours:"6:00",
	user_id: 2,
	image: nil
	}, {
	id: 4, 
	name:"Melt Shop", 
	description: "Counter-service grilled cheese sandwich shop that also serves breakfast fare & tater tots.", 
	category: 7, 
	phone_number: "646-741-7910", 
	address:"111 Fulton St",
	state: "NY", 
	city:"New York", 
	zipcode: '10038', 
	longitude: "-74.006561",
    latitude: "40.709926" ,
	open_hours: "11:00", 
	close_hours:"10:00",
	user_id: 3,
	image: File.new('app/assets/images/photos/meltshop.jpg')
	}, {
	id: 5, 
	name:"GRK Fresh Greek", 
	description: "Modern, counter-serve cafe offering design-your-own casual Greek fare in a bright, airy space.", 
	category: 4, 
	phone_number: "212-385-2010", 
	address:"51 E 8th St",
	state: "NY", 
	city:"New York", 
	zipcode: '10038', 
	longitude: "-73.993665",
    latitude: "40.731260" ,
	open_hours: "12:00", 
	close_hours:"10:00",
	user_id: 3,
	image: File.new('app/assets/images/photos/grk.png')
	}, {
	id: 6, 
	name:"Bonchon Chicken", 
	description: "Casual chain serving cooked-to-order Korean fried chicken, plus other traditional eats.", 
	category: 1, 
	phone_number: "646-692-4660", 
	address:"104 John St",
	state: "NY", 
	city:"New York", 
	zipcode: '10038', 
	longitude: "-74.006235",
    latitude: "40.707694" ,
	open_hours: "11:00", 
	close_hours:"11:00",
	user_id: 2,
	image: File.new('app/assets/images/photos/bonchon.jpeg')
	}, {
	id: 7, 
	name:"Niko Niko", 
	description: "Counter-serve spot for freshly made or grab-&-go Japanese items, from sushi to ramen to bento boxes.", 
	category: 1, 
	phone_number: "212-232-0152", 
	address:"133 John St",
	state: "NY", 
	city:"New York", 
	zipcode: '10005', 
	longitude: "-74.005015",
    latitude: "40.707179" ,
	open_hours: "11:00", 
	close_hours:"8:00",
	user_id: 3,
	image: nil
	} ])

Order.create!([ {
	id: 1,
	user_id: 1, 
	restaurant_id: 1, 
	pickup_address: "104 Fulton St, New York, NY",
	pickup_phone_number: "212-555-1234", 
	pickup_business_name:"Poke bowl", 
	dropoff_name: "Joan Borbon", 
	dropoff_address:"104 Fulton St, New York, NY" , 
	dropoff_phone_number: "(718)123-4556", 
	dropoff_business_name: "NYCDA", 
	dropoff_notes: "Please ring the doorbell before you enter."
	}, {
	id: 2, 
	user_id: 2, 
	restaurant_id: 5,
	pickup_address: "111 Fulton St, New York, NY", 
	pickup_phone_number:"212-385-2010", 
	pickup_business_name:"GRK Fresh Greek", 
	dropoff_name: "Christy Kusuma", 
	dropoff_address: "948 1st Avenue, New York, NY", 
	dropoff_phone_number: "(718)123-4556", 
	dropoff_business_name: "NYCDA", 
	dropoff_notes: "Call me when you get here."
	}, {
	id: 3, 
	user_id: 3, 
	restaurant_id: 6, 
	pickup_address: "104 Fulton St, New York, NY", 
	pickup_phone_number: "646-692-4660", 
	pickup_business_name: "Bonchon Chicken", 
	dropoff_name: "Michael Teixeira", 
	dropoff_address: "104 John St, New York, NY", 
	dropoff_phone_number: "(718)789-4556", 
	dropoff_business_name: "Toyota", 
	dropoff_notes: "Go through the back door"
	} ])

Rating.create!([ {
	id: 1, 
	order_id: 1,
	review: "This place has a great atmosphere and staff!", 
	restaurant_rating: 4  
	}, {
	id: 2, 
	order_id: 2,
	review: "Amazing food, great service, delicious cocktails!!!!", 
	restaurant_rating: 1 
	}, {
	id: 3,
	order_id: 3,
	review: "Satisfying meal for at a great price in the area",
	restaurant_rating: 5 
	} ])

MenuItem.create!([ {
	id: 1,
	restaurant_id: 1, 
	name:"Poke Bowl Special", 
	category: 1, 
	price: 12.00, 
	description:"Tuna, Kani Salad, Edamame, Scallion, Seaweed Salad, Kani, Shredded Nori, Poke Bowl House Sauce."
	}, {
	id: 2, 
	restaurant_id: 1, 
	name: "Honolulu Salmon", 
	category: 3, 
	price: 12.00, 
	description:"Salmon, Spicy Salmon, Cucumber, Edamame, Scallions, Red Onion, Mango, Masago, Crispy Onions, Spicy Ponzu."
	}, {
	id: 3,
	restaurant_id: 1, 
	name: "Nacho Supreme", 
	category: 1, 
	price: 12.00, 
	description: "Spicy Negitoro, Tortilla Chips, Cilantro, Edamame, Cucumber, Red Onion, Jalapenos, Scallions, Tomato, Wasabi Peas, Sriracha Aioli."
	}, {
	id: 4,
	restaurant_id: 1, 
	name: "Miso Hungry", 
	category: 2, 
	price: 12.00, 
	description: "Tuna, Red Onion, Scallion, Cucumber, Hijiki, Shredded Nori, Sesame Seeds, Traditional Hawaiian Sauce."
	}, {
	id: 5,
	restaurant_id: 5, 
	name: "Lamb Chomps", 
	category: 2, 
	price: 10.00, 
	description: "Three lamb chops marinated in yogurt with olive oil and herbs. Grilled against an open flame and served over turmeric brown rice."
	}, {
	id: 6,
	restaurant_id: 5, 
	name: "Spanakopita", 
	category: 2, 
	price: 10.00, 
	description: "Authentic Spinach and Feta cheese pie. With Leeks, spinach, scallions, dill, olive oil and feta cheese. Baked in house fresh every morning.."
	}, {
	id: 7,
	restaurant_id: 5, 
	name: "Baklava", 
	category: 2, 
	price: 10.00, 
	description: "20 layers of filo dough layered with chopped walnuts and Greek honey. Possibly one of the most famous Greek desserts. Amazing over frozen Yogurt."
	}, {
	id: 8,
	restaurant_id: 6, 
	name: "Sliders", 
	category: 2, 
	price: 5.00, 
	description: "Crispy chicken strips (Soy Garlic or Spicy) or Marinated Ribeye, fresh cucumber, red onions and coleslaw, served on a mini slider bun. Three per order. (633-850 cal)"
	}, {
	id: 9,
	restaurant_id: 6, 
	name: "Takoyaki", 
	category: 2, 
	price: 5.00, 
	description: "Fried octopus dumplings drizzled with Japanese mayonnaise, Katsu sauce and sprinkled with bonito flakes. (590 cal)"
	}, {
	id: 10,
	restaurant_id: 6, 
	name: "Potstickers", 
	category: 2, 
	price: 5.00, 
	description: "Lightly fried pork and vegetable dumplings brushed with Bonchon Signature sauce. Choice of: SPICY, SOY GARLIC OR HALF & HALF (570-580 cal)"
	}, {
	id: 11,
	restaurant_id: 6, 
	name: "Bonchon Salad", 
	category: 2, 
	price: 5.00, 
	description: "Crisp romaine lettuce, tossed with edamame beans, scallions, thin strips of kimchi in our sesame ginger dressing. Topped with crispy sweet potato strips and our signature fried chicken bites. (910 cal)"
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
	quantity: 3
	}, {
	id: 3, 
	order_id: 2, 
	menu_item_id: 5, 
	quantity: 2
	}, {
	id: 4,
	order_id: 3, 
	menu_item_id: 8, 
	quantity: 1
	} ])
