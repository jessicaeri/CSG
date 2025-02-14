#----------------------- Fetching data from API ----------------- 

#--------------- API - Application Programming Interface
#means you're going through the internet to obtain data from the source 


# require 'net/http'
# require 'json'

# url= URI("https://jsonplaceholder.typicode.com/posts/1") 
# response = Net::HTTP.get(url) #1. sent request, 2. get response
# data = JSON.parse(response) #3. parse the JSON
# # puts data
# pp data #pp - pretty print usually better so you can see the structure of the data

#--------------- HTTP REQUESTS -------------------------

#Why recreate the wheel when someone did it already????
    #WORK SMARTER NOT HARDER

#--------------- EXERCISE -------------------------
# Instructions:
#     Pick an API endpoint (e.g., https://jsonplaceholder.typicode.com/posts/1).
#     Create a file api_demo.rb (or any name).
#     Require the libraries:

#           require 'net/http'
#           require 'json'
#           Construct a URI and make the request:
#           url = URI("https://jsonplaceholder.typicode.com/posts/1")
#           response = Net::HTTP.get(url)
#           Parse the response:
#           ruby
#           CopyEdit
#           data = JSON.parse(response)
#           Print some interesting fields:
#           ruby
#           CopyEdit
#           puts "Title: #{data['title']}"
#           puts "Body:  #{data['body']}"
#           Run it:
#           ruby api_demo.rb
#           Optional: Try another endpoint or parse multiple items. For instance, if the API returns an array, loop over them:
#           data.each do |item|
#             puts item['title']
#           end
#           Challenge:
#           If you want them to do something fancier:
#           Store the data in a local array, filter for items, or pick a random item.
#           Print a nicely formatted message about the data.


            # Possible APIs:
            # JSONPlaceholder (test posts, users, etc.):
            # https://jsonplaceholder.typicode.com/posts
            # https://jsonplaceholder.typicode.com/users
            # PokeAPI (Pokémon data):
            # https://pokeapi.co/api/v2/pokemon/1
            # Rick and Morty API:
            # https://rickandmortyapi.com/api/character/1
            # Or any other small, public API.
         
            # HTTPBin: A simple HTTP request and response service that allows students to test various HTTP methods and behaviors. It's excellent for learning how different HTTP requests work.
            # dev.to
            # NASA's Astronomy Picture of the Day (APOD) API: Provides daily images or photographs of our universe along with a brief explanation. It's a fun way to practice making HTTP requests and handling JSON responses.
            # twilio.com
            # OpenWeatherMap API: Offers current weather data for any location worldwide. Students can practice making requests and parsing JSON data to display weather information.
            # The Cat API: Returns random pictures of cats. It's a lighthearted way to practice making API requests and handling image data.
            # For discovering more free APIs, consider exploring the following resources:
            # Public APIs: A collective list of free APIs for various purposes. It's a great place to find APIs across different categories.
            # Awesome APIs: A curated list of APIs that are categorized and well-documented, making it easier to find suitable APIs for learning and development.

# require 'net/http'
# require 'json'

# url= URI("https://hp-api.onrender.com/api/spells") 
# response = Net::HTTP.get(url) #1. sent request, 2. get response
# data = JSON.parse(response) #3. parse the JSON
# puts data
# pp data

# data.each do |spell|
#   puts "Spell: #{spell['name']}" 
#       #spell is each hash
#           #'name' - within hash
#           #'description' - within hash
#   puts "Description: #{spell['description']}"
#   puts "------------------------------------------------------------------------"
# end

# Challenge:
#           If you want them to do something fancier:
#           Store the data in a local array, filter for items, or pick a random item.
#           Print a nicely formatted message about the data.

require 'net/http'
require 'json'

url= URI("https://hp-api.onrender.com/api/spells") 
response = Net::HTTP.get(url) #1. sent request, 2. get response
data = JSON.parse(response) #3. parse the JSON

# puts "What spell are you interested in? Input keyword(e.g. killing, water, etc)."
# keyword = gets.chomp.downcase

spells_array = data #creates local array

filtered_spells = spells_array.select{|spell| spell['description'].downcase.include?(keyword)}

if filtered_spells.empty?
  puts "No spells associated with #{keyword}."
else 
  puts "Spells containing #{keyword}:"
  filtered_spells.each do |spell|
    puts "Spell: #{spell['name']}" 
    puts "Description: #{spell['description']}"
    puts "------------------------------------------------------------------------" 
  end
end

puts "Would you like to learn a random spell? (y/n)"

case gets.chomp.downcase #answer
when "y"
  rand_spell = spells_array.sample
  puts "------------------------------------------------------------------------" 
  puts "\n"
  puts "\n"
  puts "\n"
  puts "Spell: #{rand_spell['name']}" 
  puts "Description: #{rand_spell['description']}"
  puts "\n"
  puts "\n"
  puts "\n"
  puts "------------------------------------------------------------------------" 

when "n"
  puts "Farewell. It's not goodbye after all."
else 
  puts "Invalid answer."
end

#------------------------------------------------------------------------------



