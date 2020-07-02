# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Users
morgan= User.create([{first_name: "Morgan", last_name: "Farrow", password: "morgan", email: "morgan@aol.com", staff_at_restaurant_id: 1}])
brad= User.create([{first_name: "Brad", last_name: "Anderson", password: "brad", email: "brad@aol.com"}])
maureen= User.create([{first_name: "Maureen", last_name: "Farrow", password: "maureen", email: "maureen@aol.com", staff_at_restaurant_id: 2}])
