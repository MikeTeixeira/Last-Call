# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create([
	{ f_name: "Joan", l_name:"Borbon" , email:"jborbon@live.com" , username:"jborbon" , password: "test123"},
	{ f_name: "Christy", l_name:"Kusuma" , email:"ck@gmail.com" , username:"Christyk" , password: "test123"},
	{ f_name: "Michael", l_name:"Telxelra" , email:"Mt@gmail.com" , username:"MichaelT" , password: "test123"}
	])

Restaurant.create([
	{name:"Poke bowl" , description:"the best food spot ever" , category:0 , phone_number:"(212)555-1234" , location:"90 john st" , open_hours: "8am" , close_hours:"9pm" },
	{name:"Jubulee" , description:"One stop shop " , category:5 , phone_number:"(212)899-9098" , location:"30 john st" , open_hours: "6am" , close_hours:"7pm" },
	{name:"thai hut" , description:"yummy in your tummy " , category: 6 , phone_number:"(907)555-1234" , location:"80 john st" , open_hours: "5am" , close_hours:"6pm" }
	])
Rating.create([
{ restaurant_id: 1 , review: "best evaaaa", restaurant_rating:4  },
{ restaurant_id: 2 , review: "ughh gross", restaurant_rating:1 },
{ restaurant_id: 3 , review: "inexpensive and good", restaurant_rating:5 }
	])



MenuItem.create([
{restaurant_id:1 , name:"chicken bowl" , category:8 , price: 12.00 , description:"chicken and rice in a bowl"},
{restaurant_id: 2, name:"beef stew" , category:9 , price: 10.00 , description:"beef in stew"},
{restaurant_id:3 , name:"pork thai slider" , category:10 , price: 5.00 , description:"pork in ginger sauce on a bun"}
	])

MenuItemOrder.create([
{order_id:1 , menu_item_id:1 , quantity:1},
{order_id:2 , menu_item_id:2, quantity:1},
{order_id:3 , menu_item_id:3 , quantity:1}
	])

