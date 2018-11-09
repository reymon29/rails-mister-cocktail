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
aurl = "https://www.thespruceeats.com/thmb/YlhdecRcUlxy5o5TFfcmqv1CQiw=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/gin-tonic-5a8f334b8e1b6e0036a9631d.jpg"
a = Cocktail.new(name: "gin and tonic")
a.remote_photo_url = aurl
a.save

burl = "https://www.anightowlblog.com/wp-content/uploads/2017/02/Moonlight-Miami-Mule-Cocktail-FEATURE.jpg"
b = Cocktail.new(name: "Moonlight Miami Mule")
b.remote_photo_url = burl
b.save

curl = "https://www.gimmesomeoven.com/wp-content/uploads/2018/03/How-To-Make-A-Mimosa-Recipe-2.jpg"
c = Cocktail.new(name: "MIMOSAS")
c.remote_photo_url = curl
c.save
puts "completed"

