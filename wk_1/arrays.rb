#---------------------- DAY 3 --------------------------

#Question of the day: What super power would you have? 
#TELEPORTATION 

#Hot key of the day: CTRL ~ - switches between terminal and code editor 

#Array is a list of items that you display sequentially 

# numbers = [0,1,2,3,4,5]
# names = ["Jessica", "Noah", "Alanna"]

# puts names
# p numbers[3] 

# bball = ["L. James", "K. Bryant", "D. Wade"]
# puts bball
# p bball[0] # arrays numbered as [0, 1, 2, 3, ....]

# modifying/red-defining 
# p numbers 
# numbers[3]=26
# p numbers 
# [0, 1, 2, 3, 4, 5]
# [0, 1, 2, 26, 4, 5]

#add to END of array .push 
# p names
# names.push("Charles")
# p names
# ["Jessica", "Noah", "Alanna"]
# ["Jessica", "Noah", "Alanna", "Charles"]

#add to specific position of array 
# p names 
# names.insert(0, "Damen")
# p names
# ["Jessica", "Noah", "Alanna"]
# ["Damen", "Jessica", "Noah", "Alanna"]

#number of elements to be removed from the END of the array
# p numbers
# p numbers.pop #removes last index
# p numbers.pop(2) #removes last two index
# p numbers
# [0, 1, 2, 3, 4, 5]
# 5
# [3, 4]
# [0, 1, 2]

#delete index within array 
# p numbers 
# numbers.delete(1)
# p numbers
#[0, 1, 2, 3, 4, 5]
#[0, 2, 3, 4, 5]

#delete specific index
# p names 
# p names.delete_at(0) #index position NOT index - input
# p names
# ["Jessica", "Noah", "Alanna"]
# "Jessica"
# ["Noah", "Alanna"]

# ITERATING OVER AN ARRAY
# numbers = [0,1,2,3,4,5]
# names = ["Jessica", "Noah", "Alanna"]

# names.length 
# puts names.length #(how many indexes within array)

#while loop
# i = 0 
# while i < 5
#   puts "Hello class"
#   i +=1 #i = i +1
# end

# Hello class
# Hello class
# Hello class
# Hello class
# Hello class

# i = 6 #FALSE SO WOULDNT WORK
# while i < 5
#   puts "Hello class"
#   i +=1 #i = i +1
# end

# numbers = [0,1,2,3,4,5]
# names = ["Jessica", "Noah", "Alanna"]

# puts numbers.length #6 indexes (or length of array)

# i = 0 
# while i < numbers.length # while i is less than 6 (length of array)
#   puts numbers[i] #print number at i
#   i += 1 #prints numbers in EACH (1) step
# end

# i = 0 
# while i < numbers.length 
#   numbers << 10 #
#   i += 1
# end

#each loop 
# numbers.each do |x| #prints each index within array also can be any variable within || as long as it matches
#   puts x #THIS
# end

# numbers.each do |x| 
#   puts x + 1 #adds 1 to each index within array
# end

# numbers.each do |x| 
#   puts x*10 #adds 1 to each index within array
# end

# pets = ["moebeanz", "kaiju", "billy", "boboi"]
# pet_age = [6, 5, 4]

# pets.each do |x|
#   puts x
# end

# i = 0
# while i < pet_age.length #pet age = 3
#     puts pets[i] #prints only first three pets
#     i += 1 #prints numbers in EACH (1) step
#   end 

# for x in pets do
#   puts x
# end

# ----------------------- NESTED ARRAYS --------------------------

# num = [
#   [1, 2, 3], 
#   [4, 5, 6], 
#   [7, 8, 9]
# ]

# #I want to print 5!
# p num[1][1] #[second index][second index within second index]

# data = [
#   ["Jess", "Charley", "Leon"], #data 1
#   ["Fernz", "Ham", "Shim"], #data 2
#   ["hi", "hello", "hafa adai"] #data 3
# ]

# p data[1][2]
# # "Shim"

# data.each_with_index do |data, index| #"each within index" |name of variable, index|
#   puts "data #{index + 1}" #bc index starts at 0
#   data.each do |input| # data = ["Jess", "Charley", "Leon"]
#     puts "- #{input}" #prints as "bullet points"
#   end
# end

# movies = [
#   ["Fantasy", #genre
#     ["Harry Potter", "Pirates of the Carribean"]], #titles
#   ["Comedy", #genre
#     ["50 First Dates", "Bridesmaids"]] #titles
# ]

# movies.each do |genre, titles| #|index 0, index 1, ...|
#   puts "#{genre} Movies:"
#     # Fantasy Movies:
#     # Comedy Movies:
#   titles.each do |title|
#     puts "- #{title}"
#     # - 50 First Dates
#     # - Bridesmaids
#   end
# end
# Fantasy Movies:
# - Harry Potter
# - Pirates of the Carribean
# Comedy Movies:
# - 50 First Dates
# - Bridesmaids

# movies.each do |movie|
#   movie.each_with_index do |film, index|
#     p film.each do 
#   end
# end
