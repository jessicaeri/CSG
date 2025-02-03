# --------------------- DAY  10: File input and output (io) -------------------------------

# Question of the Day: Where are you struggling with  coding?
#I feel like I'm struggling to remember the previous exercises, so I'm trying to figure out a way for me to practice the older topics while learnign new things.

#Hotkey of the day: Cmd/Ctrl + Enter - Puts your cursor on a new line without affecting the current line 

#--------------------------------------------------------------------------------
# Overall Objectives
  # Gain a deeper understanding of Ruby’s Enumerable methods (each, map, select, reject, reduce, sort/sort_by).
      # Apply these methods to practical exercises and integrate them into the Contact Management program.
      # Explore working with nested data structures (arrays and hashes).
  
  # Begin a group project (Inventory Management System) to apply and extend the day’s lessons.
  # Learn personal branding best practices and improve your LinkedIn profile.

# 1. Introduction to Enumerables and Iterators
  # Key Concepts
    # What Are Enumerables?
        # Ruby’s Enumerable module provides methods that let you traverse, search, sort, and manipulate collections like arrays and hashes.


# each with Arrays & Hashes
# Example (Array):

# ruby
# numbers = [1, 2, 3, 4, 5]
# numbers.each do |number| #example of enumerable - helps us write more presentable codes. 
#   puts "The number is #{number}"
# end


# person = { "name" => "Alice", "age" => 30, "city" => "New York" }

# person.each do |key, value|
#   puts "#{key.capitalize}: #{value}"
# end


# Activity: Practice using each on an array of favorite foods and a hash representing a book.

# 2. Transforming Collections with map
# Key Concepts
# map returns a new array of transformed elements.

# numbers = [1, 2, 3, 4, 5]
# squared = numbers.map { |number| number * number } #.map creates another array

# puts "Original numbers: #{numbers.inspect}"
# puts "Squared numbers: #{squared.inspect}"
#     #// Original numbers: [1, 2, 3, 4, 5]
#     #// Squared numbers: [1, 4, 9, 16, 25]

#.inspect = allows for the raw data would be shown = [x, y, z] = acts like "p"
#puts - creates a line after every element.

# squared_numbers = []
# numbers.each do |number|
#   squared_numbers << number * number
# end 
# p squared_numbers 
    # [1, 4, 9, 16, 25]
# essentially the same thing BUT .map allows for you to manipulate the whole array, while .each visit each element within the array.

#--------------------- EXERCISE------------------------
# Task: Use map to capitalize a list of names.
# Instructions:
# Create a file named enumerables.rb.
# Define an array of names in lowercase letters.
# Use map to create a new array with each name capitalized.
# Print the new array.

# names = ["ed", "chieko", "josh", "jess"]
# capitalized = names.map {|name| name.capitalize}
# p names
# p capitalized
    # Output:
    # ["ed", "chieko", "josh", "jess"]
    # ["Ed", "Chieko", "Josh", "Jess"]

# names = ["ed", "chieko", "josh", "jess"]
# capitalized = names.map do |name|
#   full_name = "#{name} Fernandez"
#   full_name.split.map(&:capitalize).join(" ")
#         #.split - splits strings into array
#         #.map - capitalize each within the array 
#         #.join - join back each into a single string
# end

# puts "Capitalized names: #{capitalized.inspect}"
#       # Output:
#       # Capitalized names: ["Ed Fernandez", "Chieko Fernandez", "Josh Fernandez", "Jess Fernandez"]
#------------------------------------------------------

# Use Case
# : Converting strings, capitalizing names, etc.
# 3. Filtering Collections with select and reject


#--------------- select – Filtering In -----------------

# numbers = [1, 2, 3, 4, 5, 6]
# even_numbers = numbers.select { |num| num.even? }
#     #selects only the even numbers within the array
#     # Keeps elements where the block returns true.
# p even_numbers
#     #output:
#     # [2, 4, 6]

# even = numbers.select do |num|
#     #select from array with the element "num"
#   num.even?
#     #is the element even?
# end

# p even
# [2, 4, 6]


#----------------------reject – Filtering Out -------------------
# numbers = [1, 2, 3, 4, 5, 6]
# odd_numbers = numbers.reject do |num|
#   num.even?
# end
# #basically same logic BUT rejected instead

# p odd_numbers
#     #output:
#     #[1, 3, 5]

#----------------------- EXERCISE --------------------
# Task: Filter a list of words to find those longer than 4 letters.
# Instructions:
# Define an array of words.
# Use select to create a new array with words longer than 4 letters.
# Print the new array.

# words = ["donut", "tea", "sandwhich","pen", "airplane","tissue","dog", "cat"]

# long_words = words.select do |word|
#   word.length > 4
# end

# p long_words
#       #["donut", "sandwhich", "airplane", "tissue"]
# p long_words.join(", ") #removes array to display nicer
#       #"donut, sandwhich, airplane, tissue"

# long_words_reject = words.reject do |word|
#   word.length < 4 
# end
# p long_words_reject
#       # ["donut", "sandwhich", "airplane", "tissue"]
# p long_words_reject.join(", ") 
#       #"donut, sandwhich, airplane, tissue"    

#-------------------------------------------------------

letters = ["a", "b", "c", "d", "e", "i", "o", "u"]
# consonants = letters.reject { |letter| ["a", "e", "i", "o", "u"].include?(letter) }
    #reject based on these conditions
          #if the argument includes aeiou 
    # Excludes elements where the block returns true.
# Activity: Filter words longer than 4 letters; remove vowels from an array of letters.


# consonants = letters.reject do |letter|
#   # letter.include?(["a", "e", "i", "o", "u"])
#   #CANT DO THIS bc needs to be formatted 
#       #if ARRAY is included into the element
#   ["a", "e", "i", "o", "u"].include?(letter)
# end

# p consonants
# 2.5.enumerables.rb:167:in `include?': no implicit conversion of Array into String (TypeError)

#   letter.include?(["a", "e", "i", "o", "u"])
#                   ^^^^^^^^^^^^^^^^^^^^^^^^^
#         from 2.5.enumerables.rb:167:in `block in <main>'
#         from 2.5.enumerables.rb:166:in `reject'
#         from 2.5.enumerables.rb:166:in `<main>'

#EASIER METHOD
# vowels = ["a", "e", "i", "o", "u"]

# consonants = letters.reject do |letter|
#   vowels.include?(letter)
# end
    #["b", "c", "d"]
#------------------------------------------------------

# 4. Understanding reduce (a.k.a. inject)
    # Key Points
    # Combines all elements of a collection into a single value.

# Examples:
# Summation:

#-----------reduce - includes all elements of an eneumerable by a BINARY operation. 
    #ALSO CALLED INJECT

# numbers = [1, 2, 3, 4, 5]
# sum = numbers.reduce(0) { |total, num| total + num }
# # => 15

# sum = numbers.reduce do |total, number|
#       #starts at 0 (index positon = 1)
#   total + number
#   #[1, 2, 3, 4, 5]
#   #[total (1) + number(2) = 3]
#   #[total(3) + number(3) = 6]
#   #...
# end

# puts "The sum is #{sum}."
#     #The sum is 15.

# sum = 0 
# numbers.each do |number|
#   sum += number
# end
# p sum
    #15
#essentially the same thing

#----------------------EXERCISE-------------------------------
# Instructions:
# Define an array of numbers.
# Use reduce to calculate the product of all numbers.
# Print the result.

# numbers = [2,4,6,8, 10, 12, 14, 16, 18]
# sum = numbers.reduce do |total, number|
#   total + number
# end


# p sum 
    #90

# subtraction = numbers.reduce do |subtract, number|
#   subtract - number
# end

# p subtraction
    #-86
#------------ EXERCISE ----------------
# Activity: Calculate the product of an array of numbers, or find a combined string from multiple strings.
# product = numbers.reduce do |product, number|
#   product * number
# end

# p product
    #185794560

#-------------------------------------------------------

#ultimately reduce simplifies the array into one element.

# String Construction:

# words = ["Hello", "world", "this", "is", "Ruby"]
# sentence = words.reduce("") do |acc, word|
#   acc.empty? ? word : (acc + " " + word)
# end

#-------------------------------------------------------
# 5. Sorting with sort and sort_by
# Default Sort:
      #sorts alpabetically and ascending

# names = ["Carol", "alice", "Bob"]
# # sorted_names = names.sort_by { |name| name.downcase }

# sorted_names = names.sort

# p sorted_names
#   #["Bob", "Carol", "alice"]
#   #but you can see that it is CASE SENSTITIVE.
#   #Treats capitalized first then lowercase. 

#CASE INSENSITIVE
# sorted_names_ensure = names.sort_by {|name| name.downcase} #ensures its not case sensitive

# p sorted_names_ensure 
#     #["alice", "Bob", "Carol"]

# numbers = [5, 2, 8, 1]
# sorted_numbers = numbers.sort
# # => [1, 2, 5, 8]

# p sorted_numbers
#     #[1, 2, 5, 8]
    
# # Descending Sort
# descending = numbers.sort do |a, b| 
#   b <=> a #switches
# end

# p descending
#     #[8, 5, 2, 1]


# Activity
# : Practice sorting numeric and string data in various ways.
# 6. Practical Exercise: Enhancing the Contact Manager
# Task
# : Modify contact_list.rb to incorporate Enumerable methods:
# Search by name (using select).
# Sort contacts alphabetically (using sort_by).
# Count total contacts.
# Example:
# ruby
# sorted_contacts = contacts.sort_by { |c| c[:name].downcase }
# Additional Challenge
# :
# Implement error handling for user input.
# Optionally export contacts to CSV.
# 7. Working with Nested Data Structures
# Example: An array of student hashes where each student has an array of grades.
# ruby
# students = [
#   { "name" => "Alice", "grades" => [90, 85, 88] },
#   { "name" => "Bob",   "grades" => [75, 80, 72] },
#   { "name" => "Carol", "grades" => [95, 92, 89] }
# ]
# Using
# reduce to calculate average grades.
# Activity: Flatten grades into one array using flat_map, then compute the overall class average.
# 8. Data Analysis Group Activity
# Dataset Example: Products array with name, price, category.
# ruby
# products = [
#   { "name" => "Laptop", "price" => 999.99, "category" => "Electronics" },
#   ...
# ]
# Group Tasks
# :
# Sum total value (reduce).
# Filter by category (select).
# Compute average price in each category.
# 9. Enhancing the Contact List Further
# Advanced Features:
# Find contacts with missing info (select).
# Group contacts by email domain (group_by).
# Testing and Debugging:
# Add various contacts, watch for edge cases.
# Use puts statements to identify issues.

#-----------------------------------------------------
# 10. Career Services Workshop: Personal Branding and LinkedIn
    # Personal Branding
    # Identify your unique value proposition (technical & soft skills).
    # Maintain a consistent online presence (GitHub, LinkedIn, portfolio site).

# LinkedIn Profile Building
    # Headline: Summarize your role or aspiration (e.g., “Aspiring Software Developer | Skilled in Ruby”).
    # About Section: Brief introduction showcasing goals and experience.
    # Projects: Link to GitHub or personal website.
    # Networking: Connect with classmates, instructors, and industry professionals. Follow companies and share insights.

# Why It Matters:
# Makes you more visible to recruiters.
# Builds professional credibility.
# Helps you stand out in a competitive job market.

#-----------------------------------------------------------
# Homework & Action Items
# Enhance contact_list.rb:
# Implement a search using select.
# Add error handling (e.g., empty inputs).
# Ensure file operations are handled properly.
# (Optional) Export contacts to CSV.
# Commit Your Code:
# Push your updated Contact Manager to GitHub.
# Keep it well-documented and formatted.
# LinkedIn Updates:
# Add your new skills/projects.
# Craft a concise summary.
# Be ready to share your profile and ask questions next session.