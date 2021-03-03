# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all
Album.destroy_all

# User

jason = User.create!(email: 'jason@gmail.com', password: 'jasoniscool')
jeff = User.create!(email: 'jeff@gmail.com', password: 'jeffiscool')

# Band

peppers_a = Band.create!(name: 'Big Peppers')
peppers_b = Band.create!(name: 'Little Peppers')

# Album

baby = Album.create!(name: 'Baby on Baby', band: peppers_a, year: 2019)
money = Album.create!(name: 'Money Gang', band: peppers_b, year: 2013, live: true)