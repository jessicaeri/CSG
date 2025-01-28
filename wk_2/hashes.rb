# --------------------- DAY  5-------------------------------

# Question of the Day: Would you rather sweat MAYO or have grass for hair?
# Grass for hair DUH.

#Hotkey of the day: OPT + up or down - allows you to move whatever lines of code that are highlighted up or down a line and it will fix the indentation as well

#------------------ REVIEW ARRAYS ------------------------------
#Array - ordered list of a specific data set
  #uses SWUARE brackets []
# numbers = [1, 2, 3, 4, 5]
# p numbers [0] #// 1

# fruits =["apples", "cherries", "bananas"]
# puts fruits[2] #// bananas

# nested_array = [
#   [1,2,3],
#   [4,5,6],
#   [7,8,9],
# ]
# p nested_array[0][0] #//1
# p nested_array[0] #//[1,2,3]

#hashes are set to store data 

  # {key => value, key => value}
  
  # ARRAY
  # names = ["Alanna", "Noah", "Audreana"]

#hash it does not matter where the data is, as long as you know the KEY you are able to get it 
  # aka dictionary (python), json (javescript)

#think of it like a dictionary 
  #as long as you know the key you can get the def 
  #uses CURLY brackets {}

  # person = {
  #   "name" => "Alice",
  #   "age" => 30,
  #   "city" => "New York"
  # }
 
  #ALSO CAN BE WRITTEN AS 
  #person = {
  #   name: "Alice",
  #   age: 30,
  #   city: "New York"
  # }
  # FASTER TO WRITE OUT but can write in etiher a string ("") we use a symbol (the word)
  # p person["name"] #//"Alice"
  # p person["city"] #// "New York"

#---------------------- EXERCISE ----------------------------

#Task: Create a hash representing yourself with keys for "name", "age", and "hobby".
# Instructions:
# Create a file named hashes.rb.
# Define the hash and access each value.

#   person_a = {
#     name: "Jessica",
#     age: 26,
#     hobby: "DIY-ing"
#   }

# person_a = {
#   name => "Jessica",
#   age => 26,
#   hobby => "DIY-ing"
# }
# puts person_a["name"] #// Jessica

# #If using "=>" you would have to uses quotes["symbol"]

# person_a = {
#   name: "Jessica",
#   age: 26,
#   hobby: "DIY-ing"
# }
# puts person_a[:name] #// Jessica

# #If using ":" you would have to incorporate the [: symbol]

# puts person_a[:name] #// Jessica
# puts person_a[:age] #// 26
# puts person_a[:hobby] #// DIY-ing

# puts "My name is #{person_a[:name]}. I am #{person_a[:age]}. My current hobby is #{person_a[:hobby]}. \n"

#-------------------------------------------------------------------------------------------

# #API is a database that you can manipulate 
#   # most of API is in json 

# #how to obtain two values from a dataset 
# p person_a.values_at(:name, :age)

# numbers = [1, 2, 3, 4, 5]
# p numbers #//[1, 2, 3, 4, 5]

#REASSIGNS THE VALUE AT 0
# numbers[0]= 10
# p numbers #//[10, 2, 3, 4, 5]

# person_a = {
#   name: "Jessica",
#   age: 26,
#   hobby: "DIY-ing"
# }
# puts person_a[:name] #// Jessica
# person_a[:name] = "Charles"
# puts person_a[:name] #// Charles

#adding to hash
# numbers = [1, 2, 3, 4, 5]
# numbers.push(10) #adds 10 to the end
# numbers << 10 #^ the same
# p numbers #//[1, 2, 3, 4, 5, 10]

# person_a = {
#   name: "Jessica",
#   age: 26,
#   hobby: "DIY-ing"
# }

# person_a[:country] = "Guam" #add key value pair of country:USA
# person_a[:phone_numer] = 6789998212 # add key value pair phone_number: 678998212

# p person_a #//{:name=>"Jessica", :age=>26, :hobby=>"DIY-ing", :country=>"Guam", :phone_numer=>6789998212}

# person_a.delete(:hobby) #deletes key value  pair {:name=>"Jessica", :age=>26, :country=>"Guam", :phone_numer=>6789998212}

#If using string method " " then would need to use ["value"] instead of symbol [:value]

#--------------------------- EXERCISE -------------------------------------
#Task: Modify your person hash:
# Add a new key-value pair for :favorite_food.
# Update your :hobby.Remove the :age key.

# person_a = {
#   name: "Jessica",
#   age: 26,
#   hobby: "DIY-ing"
# }

# person_a[:favorite_food] = "CRISPY pork belly"
# puts person_a #//{:name=>"Jessica", :age=>26, :hobby=>"DIY-ing", :favorite_food=>"CRISPY pork belly"}

# person_a[:hobby] = "cooking"
# puts person_a #//{:name=>"Jessica", :age=>26, :hobby=>"cooking", :favorite_food=>"CRISPY pork belly"}

# person_a.delete(:age)
# puts person_a #//{:name=>"Jessica", :hobby=>"cooking", :favorite_food=>"CRISPY pork belly"}

# puts "My name is #{person_a[:name]}. My current hobby is #{person_a[:hobby]}. My favorite food is #{person_a[:favorite_food]}. \n"
# #// My name is Jessica. My current hobby is cooking. My favorite food is CRISPY pork belly. 

#-------------------------------------------------------------------------------------


# numbers = [1, 2, 3, 4, 5]
# numbers.each do |number|
#   p number
# end
# 1
# 2
# 3
# 4
# 5

# person_a = {
#   name: "Jessica",
#   age: 26,
#   hobby: "DIY-ing"
# }
# person_a.each do |key, value|
#   puts "Key = #{key} and value = #{value}"
# end
# # Key = name and value = Jessica
# # Key = age and value = 26
# # Key = hobby and value = DIY-ing

# person_a.each do |a, b| #can be any variable as long as it matches
#   puts "Data = #{a} and Value = #{b}"
# end

#------------ Combining Arrays and Hashes ---------------------------------

# Nested means x within X

# library = [
#   {title: "1984", author:  "George Orwell", pages: 328},
#   {title: "Brave New World", author:  "Aldous Huxley", pages: 311},
#   {title: "Farenheit 451", author:  "Ray Bradbury", pages: 194},
# ]
# p library [0]#// {:title=>"1984", :author=>"George Orwell", :pages=>328}
# p library [0][:title] #//"1984"

#------------------------- EXERCISE --------------------------------------
#Task: Create a program that stores information about multiple people.
# Instructions:
# In your hashes.rb.
# Define an array of hashes, where each hash represents a person with keys for :name, :age, and :city.
# Iterate over the array to print out each person's information.


# jess_pets = [
#   {name: "Moe", birth_year: 2019, species: "Felis catus"},
#   {name: "Kaiju", birth_year: 2020, species: "Canis lupus familiaris"},
#   {name: "Billy", birth_year: 2022, species: "Felis catus"},
#   {name: "Boboi", birth_year: 2024, species: "Felis catus"}
# ]
# #omg sorry I just read the instructions fully now lol 

# jess_pets.each do |pet| #whole data set
#   name = pet[:name] #define name with the dataset "pet"
#   birth_year = pet[:birth_year]
#   species = pet[:species]

#   age = 2024 - birth_year

#   puts "Name: #{name}" #lists each name within data set?
#   puts "  Species: #{species}"
#   puts "  Age: #{age}"
# end

# population_a = [
# {name: "Jessica", age: 26, city: "Yigo"},
# {name: "Caley", age: 26, city: "Inalajan"},
# {name: "Isa", age: 25, city: "Talofofo"}
# ]

# population_a.each do |person| #whole data set but separating it by {} PERSON {0},{1},{2}
#   puts "Buenas my name is #{person[:name]}! I am #{person[:age]} yo! I am from the beautiful village of #{person[:city]}!! \n"
# end

#------------------------------------------------------------

# Arrays are great for an ordered sequential list!!
    #todolist
  # numbers = [1, 2, 3, 4, 5]


# Hashes are good for a database 
    # ex: students info (name, age, grade)
  # person_a = {
  #   name: "Jessica",
  #   age: 26,
  #   hobby: "DIY-ing"
  # }


