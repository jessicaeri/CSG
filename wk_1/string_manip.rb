# 2. String Manipulation Mini-Project

# Goal: Practice more advanced Ruby string methods beyond .upcase, .downcase, etc.

# Steps
# Create a new file named string_manip.rb.

# Prompt the user:
# Enter a sentence:
# Apply Multiple Methods to the user’s input:
# .reverse to flip the text.
#  .split the sentence into an array of words, then .join it back into a string.
# .gsub() - to replace a specific word or character.
#   .gsub('word to be replaced','replacing word', df (input vector))
#   gsub(pattern, replacement, x) pattern: The pattern to look for replacement: The replacement for the pattern x: The string to search
# .include? to check if a substring exists.

# Print Each Result with clear labels.

# puts "Reversed: #{reversed}" 
# puts "Words Array: #{words}" 
# puts "After replacement: #{replaced}"

# Add Comments explaining at least one new method you used.

# (Bonus) If the sentence includes your name, print a special message (e.g., "Hey, that's my name!").


# puts "Enter a sentence:"
# sentence = gets.chomp
# puts "REVERSE: #{sentence.reverse} \n "
# puts "WORDS ARRAY: #{sentence.split} \n "
# puts "#{sentence.split.join} \n " #in order for .join to work it would need to join an input that already split either by function or manual input.

# puts "Introduce yourself (Hello my name is ____!)"
# greeting = gets.chomp

# replaced = "Hello"
# puts "After replacement:#{greeting.gsub("Hello","Buenas yan Hafa Adai",)} "
# cat = "billy" 

# if greeting.include?(cat)
#   puts "\n "
#   puts "Hey, that's my cat's name!!"
# else
# end

# puts "How would you like to manipulate your sentence? 1 - flip it and reverse it, 2 - hit it and split it, 3 - gsub par, or 4 - does the limit (string) exist? "
# manipulate = gets.chomp
# puts "\n "


