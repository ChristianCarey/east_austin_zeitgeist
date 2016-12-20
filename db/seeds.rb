# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'httparty'

puts "Destroying comments..."
Comment.destroy_all

puts "Getting JSON..."
response = HTTParty.get("https://data.austintexas.gov/resource/urw3-ardw.json?$$app_token=#{ENV['austin_app_token']}")

puts "Parsing JSON..."
comments = JSON.parse(response.body)

# For testing without hitting the API
# comments = [ { "category" => "a", "comment" => "a", "theme" => "a", "zip_code" => "a" } ]

puts "Creating comments..."
comments.each do |comment|
  category = comment["category"].strip
  if category[category.length - 1] == "L"
    category = category[0..5]
  end

  text = comment["comment"].strip
  
  if theme = comment["theme"]
    theme = theme.strip
  else
    theme = "No theme chosen."
  end
  
  if zip_code = comment["zip_code"]
    zip_code = zip_code.strip
  else
    zip_code = "No zip code chosen"
  end

  Comment.create(category: category,
                 text:     text,
                 theme:    theme,
                 zip_code: comment["zip_code"])
end

puts "Analyzing tone..."


