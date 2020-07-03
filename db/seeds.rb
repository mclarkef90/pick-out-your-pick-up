#Users
morgan= User.create([{first_name: "Morgan", last_name: "Farrow", password: "morgan", email: "morgan@aol.com", restaurant_owner: true}])
brad= User.create([{first_name: "Brad", last_name: "Anderson", password: "brad", email: "brad@aol.com"}])
maureen= User.create([{first_name: "Maureen", last_name: "Farrow", password: "maureen", email: "maureen@aol.com", restaurant_owner: true}])

#Genres
italian= Genre.create([{name: "Italian"}])
greek= Genre.create([{name: "Greek"}])
american= Genre.create([{name: "American"}])
chinese= Genre.create([{name: "Chinese"}])
japanese= Genre.create([{name: "Japanese"}])
indian= Genre.create([{name: "Indian"}])
bbq= Genre.create([{name: "Barbeque"}])
mideast= Genre.create([{name: "Middle Eastern"}])
mexican= Genre.create([{name: "Mexican"}])
eastern= Genre.create([{name: "Eastern European"}])
carribean=Genre.create([{name: "Carribean"}])
african=Genre.create([{name: "African"}])
georgian=Genre.create([{name: "Georgian"}])

#restaurants
bandit= Restaurant.create([{name: "Bandit Taco", address_one: "4629 41st St NW", city: "Washington", state: "DC", zipcode: "20016", genre_id: 9, user_id: 1}])
kith= Restaurant.create([{name: "Kith and Kin", address_one: "801 Wharf Street, SW", city: "Washington", state: "DC", zipcode: "20024", genre_id: 12, user_id: 1}])
supra= Restaurant.create([{name: "Supra", address_one: "1205 11th Street NW", city: "Washington", state: "DC", zipcode: "20001", genre_id: 13, user_id: 1}])
caddies= Restaurant.create([{name: "Caddies", address_one: "4922 Cordell Avenue", city: "Bethesda", state: "MD", zipcode: "20814", genre_id: 3, user_id: 1}])
texas= Restaurant.create([{name: "Texas Jacks Barbecue", address_one: "2761 Washington Blvd", city: "Arlington", state: "VA", zipcode: "22201", genre_id: 7, user_id: 1}])

#restaurant_reviews
banrev=RestaurantReview.create([{user_id: 3, restaurant_id:1, rating: 3, comment: "Cute neighborhood spot. Food is okay"}])
kithrev=RestaurantReview.create([{user_id: 1, restaurant_id: 2, rating: 4, comment: "Upscale, expensive, but worth it for a night out. Ask to sit outside."}])
suprev=RestaurantReview.create([{user_id: 1, restaurant_id: 3, rating: 5, comment: "My favorite restaurant in DC. Absolutely Amazing."}])
caddiesbrunch=RestaurantReview.create([{user_id: 2, restaurant_id: 4, rating: 5, comment: "Solid restaurant. Great for watching a game or just grabbing beers/comfort food."}])
texasrev=RestaurantReview.create([{user_id: 1, restaurant_id: 3, rating: 5, comment: "Bar is small! While it is not super comfortable, the happy hour is great. Get there early to grab seats."}])

#menus
banditmenu= Menu.create([{name: "Daily", details: "Hours of Operation: Mon - Thurs 11:00 AM – 10:00 PM; Fri -; Sat 11:30 AM- 1:00 AM; Sun 11:30 AM - 9 PM", restaurant_id: 1}])
ktihmenu= Menu.create([{name: "Dinner", details: "Hours of Operation: Thursday 5:00pm to 9:30pm (last seating 8:30pm); Friday, Saturday and Sunday 12:00pm to 2:30pm and 4:00pm to 9:30pm (last seating 8:30pm)", restaurant_id: 2}])
supradinmenu= Menu.create([{name: "Dinner", details: "Hours of Operation: Mon, Tue, Wed, Thur - 5:00 PM - 10:00 PM; Fri, Sat - 11:00 AM - 11:00 PM; Sun - 11:00 AM - 10:00 PM", restaurant_id: 3}])
caddiesbrunch= Menu.create([{name: "Brunch", details: "Available Saturdays and Sundays 11am-3:30pm", restaurant_id: 4}])
texasmenu= Menu.create([{name: "Happy Hour", details: "Available Monday-Friday 4pm-7pm", restaurant_id: 5}])

#menuitem
taco=MenuItem.create([{name:"Quesadilla Platter", description: "Large quesadilla with rice and beans. Your choice of beef, chicken, pork, or vegetables inside.", price: "9.99", chef_specialty: false, vegan: false, menu_id: 1}])
goat=MenuItem.create([{name:"Goat Roti", description: "Goat Roti with Curried Goat, Crispy Potatoes and Dahl Puri Roti", price: "20.99", chef_specialty: true, vegan: false, menu_id: 2}])
dump=MenuItem.create([{name:"Khinkali", description: "Soup dumplings with filling of pork & beef or cheese & fresh mint", price: "12.00", chef_specialty: true, vegan: false, menu_id: 3}])
slider=MenuItem.create([{name:"4 Sliders", description: "Pick 4 Sliders (Burger, Reuben, French Dip, Pulled Pork, Buffalo Chicken, Chicken Parmesan), Served With Your Choice Of Side And A Pickle", price: "16.00", chef_specialty: false, vegan: false, menu_id: 4}])
wing=MenuItem.create([{name:"Crispy Smoked Wings", description: "Smoked then fried, tossed in desired sauce and served with homemade ranch", price: "6.00", chef_specialty: true, vegan: false, menu_id: 5}])

#menu_item_reviews
tacrev=MenuItemReview.create([{user_id: 3, menu_item_id: 1, rating: 3, comment: "Salty, greasy, but good. Recommend sticking with quesadilla."}])
goatrev=MenuItemReview.create([{user_id: 1, menu_item_id: 2, rating: 5, comment: "Goat Roti is traditional and delicious. Wish it was available closer to home."}])
suprev=MenuItemReview.create([{user_id: 1, menu_item_id: 3, rating: 5, comment: "The dumplings are unbelievable."}])
caddiesbrunch=MenuItemReview.create([{user_id: 2, menu_item_id: 4, rating: 5, comment: "Sliders are best choice if you are hungry."}])
texasrev=MenuItemReview.create([{user_id: 1, menu_item_id: 5, rating: 5, comment: "Great beer list. Great wing deal!!"}])

#carts
one=Cart.create([{user_id: 1}])
two=Cart.create([{user_id: 2}])
three=Cart.create([{user_id: 3}])

#takeoutorders
tacos=TakeOutOrder.create([{cart_id: 1, menu_item_id: 1, quantity: 2}])
goats=TakeOutOrder.create([{cart_id: 2, menu_item_id: 2, quantity: 1}])
dumplings=TakeOutOrder.create([{cart_id: 3, menu_item_id: 3, quantity: 3}])
slides=TakeOutOrder.create([{cart_id: 1, menu_item_id: 4, quantity: 2}])
wings=TakeOutOrder.create([{cart_id: 1, menu_item_id: 5, quantity: 2}])
