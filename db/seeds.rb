# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ingredient.destroy_all if Rails.env.delevopment?

require 'json'
require 'open-uri'

puts "opening url"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
list_serialized = open(url).read
list = JSON.parse(list_serialized)
list['drinks'].each do |ingredient|
  print "."
  Ingredient.create name: ingredient['strIngredient1']
end
puts
puts "completed seed"

Cocktail.destroy_all if Rails.env.delevopment?
puts "Adding drinks"
# Cocktail.create(name: "Matthan", image_url: "http://res.cloudinary.com/dfr1rmbqg/image/upload/v1527231030/image1.jpg")
# Cocktail.create(name: "Bloody Mary", image_url: "http://res.cloudinary.com/dfr1rmbqg/image/upload/v1527231029/image2.jpg")
puts "completed"

