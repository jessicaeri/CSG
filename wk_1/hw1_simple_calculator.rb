# Day 1 - Homework

# Instructions
# Expand Your Simple Calculator

# Take the basic calculator you started in class (simple_calculator.rb) and add support for five operations:

# add, subtract, multiply, divide, and modulo (%).

# Handle Invalid Operations

# If the user enters an operation other than the five valid ones, print "Unknown operation".

# Avoid Crashes When Dividing by Zero

# Before performing division or modulo, check if num2 is zero. If it is, print an error message like "Error: Cannot divide by zero!" and skip the operation.

# Use Comments

# Include at least one comment explaining a tricky part of your code or an important design decision.

# Suggested Flow

# Prompt the user:

# Enter the first number: 
# Enter the second number: 
# Choose operation (add, subtract, multiply, divide, modulo):
# Convert inputs to the appropriate data type (.to_f or .to_i).

# Use an if/elsif/else or case statement for each operation.

# Print the final result if it’s valid.

# If the operation is invalid, print "Unknown operation".

# Example Interaction

# Enter the first number: 
# 10 
# Enter the second number: 
# 0 
# Choose operation (add, subtract, multiply, divide, modulo): 
# divide 
# Error: Cannot divide by zero!

# ----------------------------------------------------------------

# loop do
#   puts "Please type a number."
#   n1 = gets.chomp.to_f

#   puts "Please type a second number."
#   n2 = gets.chomp.to_f

#   puts "Would you like to add, subtract, multiply, divide, or modulo?"
#   operation = gets.chomp
#   puts " \n "

#     if operation.downcase == "add"
#       puts "Result: #{n1 + n2}!"
#     elsif operation.downcase == "subtract"
#       puts "Result: #{n1 - n2}!"
#     elsif operation.downcase == "multiply"
#       puts "Result: #{n1 * n2}!"
#     elsif operation.downcase == "divide"
#       if n2 == 0 #nested loop to validate n2 does not equal 0
#           puts "Error: Cannot divide by 0 :("
#       else 
#         puts "Result: #{n1/n2}!" #n2 does not equal 0 would run operation
#       end
#     elsif operation.downcase == "modulo"
#       if n2 == 0 
#         puts "Error: Cannot modulo by 0"
#       else 
#         puts "Result: #{n1%n2}!"
#     end
#     else
#       puts "Unknown operation."
#     end
#     # (Optional Bonus)
#     # After printing the result, ask the user if they want to perform another calculation (y/n). If they choose y, prompt again in a loop.
#     puts "Would you like to perform another opertation? (y/n)"
#     continue = gets.chomp.downcase
#     break unless continue == "y"
#   end

 


# Submission / Sharing
# Keep your file locally, or push to GitHub if you’re comfortable.

# If you have questions, post your code snippet and any error messages in Slack.

#---------------------------------------------------------------

# Day 1 - Optional Topics

# 1. Debugging Practice
# Goal: Strengthen your debugging skills by introducing and fixing intentional errors.

# Steps
# Add an Error

# In simple_calculator_enhanced.rb (or another Ruby file), misspell a variable name in one place to create an error.

# Notice the error message in your terminal when you run the code.

# Use Print Statements

# Insert puts statements at strategic points, such as:

# ???????puts "DEBUG: n1 = #{n1}, n2 = #{n2}" ?????????


# Run your program to see how print statements help track variable changes.

# Remove or comment them out once you fix the bug.

# (Extra) Experiment with IRB or pry

# Open IRB or pry to test small snippets:

# irb 
# > num1 = 10 
# > num2 = 3 
# > num1 / num2
# Observe how integer division might truncate results.