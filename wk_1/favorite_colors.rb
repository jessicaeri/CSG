# ------------------ Day 3 - Optional Topics ----------------------------

# 1. Exploring More Array Methods
# Concepts:
# Array Methods:
# .shift, .unshift, .delete_at, .include?, .sort

# ----------------------------Activity:-------------------------------------
# Experiment with additional array methods in your favorite_colors.rb file.

# puts "What's your favorite color?"
# colors = ["navy_blue", "black", "brown", "mustard_yellow"]

# # Remove the first element
# first_color = colors.shift
# puts "Removed the first color: #{first_color}"

# # Add an element to the beginning
# colors.unshift("orange")
# puts "Added a color to the beginning: #{colors.inspect}"

# # Check if an element exists
# if colors.include?("blue")
#   puts "Blue is in the array."
# else
#   puts "Blue is not in the array."
# end

# # Sort the array
# sorted_colors = colors.sort
# puts "Sorted colors: #{sorted_colors.inspect}" #arranges alphabetically


# -------------- 2. Introduction to Enumerables ---------------
# Concepts:
# Enumerable Methods:
# .map, .select, .reject

# Activity:
# Task: Given an array of numbers, use enumerable methods to perform transformations.


numbers = [1, 2, 3, 4, 5, 6]

# # Using map to square each number
squares = numbers.map {|num| num ** 2 }
puts "Squares: #{squares.inspect}" 
#Squares: [1, 4, 9, 16, 25, 36]

# # Using select to get even numbers
evens = numbers.select { |num| num.even? }
puts "Even Numbers: #{evens.inspect}"

# # Using reject to exclude numbers greater than 4
# small_numbers = numbers.reject { |num| num > 4 }
# puts "Numbers less than or equal to 4: #{small_numbers.inspect}"