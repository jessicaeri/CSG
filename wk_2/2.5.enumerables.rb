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

numbers = [1, 2, 3, 4, 5]
squared = numbers.map { |number| number * number } #.map creates another array

puts "Original numbers: #{numbers.inspect}"
puts "Squared numbers: #{squared.inspect}"
#// Original numbers: [1, 2, 3, 4, 5]
#// Squared numbers: [1, 4, 9, 16, 25]

# Use Case
# : Converting strings, capitalizing names, etc.
# 3. Filtering Collections with select and reject
# select – Filtering In
# ruby
# numbers = [1, 2, 3, 4, 5, 6]
# even_numbers = numbers.select { |num| num.even? }
# Keeps elements where the block returns
# true.
# reject – Filtering Out
# ruby
# letters = ["a", "b", "c", "d", "e", "i", "o", "u"]
# consonants = letters.reject { |letter| ["a", "e", "i", "o", "u"].include?(letter) }
# Excludes elements where the block returns
# true.
# Activity: Filter words longer than 4 letters; remove vowels from an array of letters.
# 4. Understanding reduce (a.k.a. inject)
# Key Points
# Combines all elements of a collection into a single value.
# Examples:
# Summation:
# ruby
# numbers = [1, 2, 3, 4, 5]
# sum = numbers.reduce(0) { |total, num| total + num }
# # => 15
# String Construction:
# ruby
# words = ["Hello", "world", "this", "is", "Ruby"]
# sentence = words.reduce("") do |acc, word|
#   acc.empty? ? word : (acc + " " + word)
# end
# Activity: Calculate the product of an array of numbers, or find a combined string from multiple strings.
# 5. Sorting with sort and sort_by
# Default Sort:
# ruby
# sorted_numbers = [5, 2, 8, 1].sort
# # => [1, 2, 5, 8]
# Descending Sort
#  (using a block):
# ruby
# descending = [5, 2, 8, 1].sort { |a, b| b <=> a }
# Case-Insensitive Sort
# :
# ruby
# names = ["Carol", "alice", "Bob"]
# sorted_names = names.sort_by { |name| name.downcase }
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