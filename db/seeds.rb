# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require 'json'
require 'open-uri'

puts "Cleaning data..."
Ingredient.destroy_all
# apply on the model Ingredient
puts 'Creating ingredients...'
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)
# puts ingredients
# testing -> rails db:seed
# puts ingredients['drinks']
ingredients['drinks'].each do |ingredient| # why not |id, ingredient| ?
# puts Ingredient.create(name: ingredient['strIngredient1']) -> output = #<Ingredient:0x00007ff1c43a8e38>
# puts Ingredient.create(name: ingredient['strIngredient1']).name
# found .name by testing in rails c -> Ingredient.last.name (name required in order to get result!)
  i = Ingredient.create(name: ingredient['strIngredient1'])
  puts "create #{i.name}"
end