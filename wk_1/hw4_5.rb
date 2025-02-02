#------------------Day 4 - Homework---------------------------
# Task:
#Project: Create a Number Statistics Program.
#Instructions:
#Create a file named number_statistics.rb.
# Program Requirements:
    # Ask the user to enter a series of numbers, separated by commas.
    # Convert the input into an array of numbers.
    # Define methods to:
        # Calculate the sum of the numbers.
        # Calculate the average.
        # Find the maximum and minimum numbers.
        # Sort the numbers in ascending order.
        # Display the results to the user.

# Example Interaction:

# Enter numbers separated by commas:
# 5, 10, 15, 20, 25

# Statistics:
# Sum: 75
# Average: 15.0
# Maximum: 25
# Minimum: 5
# Sorted Numbers: [5, 10, 15, 20, 25]

# numbers = [ 1,2,3,4,5]

# puts numbers.sum
# puts "#{numbers.sum/numbers.length}"
# puts numbers.sort
# puts numbers.sort(0)
# puts numbers.sort(4)

#---------------------------------Day 4 - Optional Topics------------------------------------
# 1. Default Parameters in Methods

# Concepts:
# Assigning Default Values to Method Parameters: A default parameter gives a method a "backup" value to use if the caller doesn’t provide one. This makes your code more flexible and prevents errors when a required argument is missing.

# Understanding How Default Parameters Work: When you define a default value, the method can be called with or without the argument. If no argument is provided, the default value is used; if an argument is provided, it overrides the default.

# Activity:
# Modify methods you’ve written to include default parameters. Try setting a default value that the method will use if no value is passed in.

# Example:
# def greet(name = "stranger")
#   puts "Hello, #{name}!"
# end

# def sort_namelist(name_list =["moebean", "kaiju", "billy", "boboi"])
#   sorted_list = name_list.sort

#   puts "Please see alphabetically sorted attendance list below:"

#   sorted_list.each_with_index do |attendance, index| #use each_with_index to make numebred list
#     puts "#{index + 1}. #{attendance}"
#   end
# end

# sort_namelist
# # Please see alphabetically sorted attendance list below:
# # 1. billy
# # 2. boboi
# # 3. kaiju
# # 4. moebean


# class_1 = ["chieko","channing", "morgan", "edward", "joshua", "isa"]

# sort_namelist(class_1)
# # Please see alphabetically sorted attendance list below:
# # 1. channing
# # 2. chieko
# # 3. edward
# # 4. isa
# # 5. joshua
# # 6. morgan



#---------------------------2. Variable Scope in Methods------------------------------
# Concepts:
# Understanding local variables within methods.
# Recognizing that variables defined inside methods are not accessible outside.

# Activity:
# Experiment with variables inside and outside methods to see how scope affects them.
# Example:


# def show_variable
#   x = 10
#   puts "Inside method, x = #{x}"
# end

# show_variable  # Outputs: Inside method, x = 10
    # # Trying to access 'x' outside the method will cause an error
    # # puts x  # Uncommenting this line will raise an error
    # In this example:

# x is defined within show_variable, so puts "Inside method, x = #{x}" works inside the method.

# Outside of show_variable, x doesn’t exist, so trying to puts x would cause an error.

# x = 10
# def show_variable
    
#     puts "Inside method, x = #{x}"
# end
# show_variable

# hw4_5.rb:110:in `show_variable': undefined local variable or method `x' for main:Object (NameError)
        #  puts "Inside method, x = #{x}"
        #                             ^
        # from hw4_5.rb:112:in `<main>'

#------------------------------Day 5 - Homework-----------------------------------------

# Assignment:
# Complete your Command-Line To-Do List Application

# Project Requirements:
    # User Interface:
    # Display a menu with options:
        # Add a task
        # View tasks
        # Mark task as completed
        # Delete a task
        # Exit

# Functionalities:
    # Add a Task:
    # Prompt the user to enter a task description.
    # Store the task in an array.

    # View Tasks:
    # Display all tasks with their status (completed/not completed).
    # Mark Task as Completed:
        # Allow the user to mark a specific task as completed.
    # Delete a Task:
        # Allow the user to delete a specific task.
    # Exit:
        # Terminate the application.
    # Once completed, push it up to GitHub 
    # Career Services Homework:
        # Review your self-assessment and career goals.
        # Prepare a brief plan outlining steps to achieve your goals.

        #raw dog thsi without looking up anyhting

# tasks = []

# def addtask(x)
#     loop do
#         puts "What task would you like to add?\n"
#         add_task = gets.chomp 

#         x.push(add_task)
#         return "#{add_task} [ ]"
#     end 
# end

# def complete_task(x)
#     puts "What task would you like to mark complete?"
#     x.each_with_index do |todo, index| #array, index position
#         puts "#{index + 1}. #{todo}" #adjusts for one in index position. each array
#     end

#     complete_task = gets.chomp.to_i

#     if complete_task <= 0 || complete_task > complete_task.length
#         puts "Invalid input. Please select number from list."
#     else 
#         index = complete_task - 1 #adjusts for index 0
#         if x[index].include?("[ ]") #if the input has []
#         x[index] = x[index].sub("[ ]", "[X]") #substitute for [X]
#         puts "\n #{x[index]} has been marked as completed! \n"
#         end
#     end
# end
# loop do 
  

#     puts "What would you like to do?"
#     puts "1. Add a task"
#     puts "2. View tasks"
#     puts "3. Mark task as completed"
#     puts "4. Delete a task"
#     puts "5. Exit"

#     task_choice = gets.chomp.to_i

#     if task_choice == 1 #add_task
#        addtask(tasks)

#     elsif task_choice == 2 #view
#         tasks.each_with_index do |todo, index| #array, index position
#           puts "#{index + 1}. #{todo}" #adjusts for one in index position. each array
#         end
#     elsif task_choice == 3 #mark tasks completed
#         complete_task(tasks)

#     elsif task_choice == 4 #delete a task
       
#         puts "Which task would you like to delete? \n "
#         tasks.each_with_index do |todo, index| #array, index position
#             puts "#{index + 1}. #{todo}" #adjusts for one in index position. each array
#         end

#         delete_task = gets.chomp.to_i

#         if delete_task <= 0 || delete_task > tasks.length 
#           puts "Invalid input. Please select number from list."
#         else 
#             delete_action = tasks.delete_at(delete_task - 1)
#             puts "#{delete_action} has been removed."
#         end

#     elsif task_choice == 5 #exit
#         puts "Goodluck! Goodbyeeee!"
#     break 
#     else 
#         puts "Please select a valid option 1- 5."
#     end
    
    
# end

#---------------------------Day 5 - Optional Topics-----------------------

# BONUS

# If you want an extra challenge, try adding one, two, or all of these features:

# Search for Tasks

# Add a menu option that prompts the user for a keyword.

# Display only the tasks whose description includes the keyword.

# Clear All Completed Tasks

# Add a menu option to remove all tasks that have already been marked as completed.

# Confirmation Before Delete

# When the user chooses to delete a specific task, prompt them with:

# Are you sure you want to delete this task? (Y/N)
# Only proceed with deletion if the user confirms “Y.”

