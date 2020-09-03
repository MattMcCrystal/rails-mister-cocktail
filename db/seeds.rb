require 'json'
require 'open-uri'

puts 'Cleaning Database...'

Ingredient.destroy_all

puts 'Creating Ingredients...'

result = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
drinks = result['drinks']

drinks.each do |hash|
  hash.each do |k, v|
    Ingredient.create(name: v)
  end
end

puts "Created #{Ingredient.count} Ingredient(s)"