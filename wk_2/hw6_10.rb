#-----------------------Day 6 - Homework-----------------------------------
  #Complete the Exercise from class:
    #Create a simple command-line address book application.
  #Instructions:
    #Create a file named address_book.rb.
  #Program Requirements:
    #The program should display a menu with options:
    #Add a contact
    #View all contacts
    #Search for a contact
    #Exit

# Add a Contact:
    #Prompt the user for the contact's name, phone number, and email.
    #Store each contact as a hash within an array.

# View All Contacts:
  #Display all contacts with their details.

# Search for a Contact:
  # Prompt for the name to search.
  # Display the contact's information if found.

# Bonus (Optional Add-Ons)
  #Once you have a basic address book that can add, view, and search for contacts, try adding one or more of the following enhancements:

  # 1. Delete a Contact
    # Objective: Allow users to remove a contact from the address book.

      # Implementation:
        # Add a new menu option, e.g., “5. Delete a contact.”
        # Prompt the user to enter the name of the contact to delete.
      # Search the contacts array for that name.
      # If found, remove the contact from the array.
      # If not found, display a message like “Contact not found.”

      # Hint: You can use a method like contacts.delete_if { |contact| contact[:name].downcase == name_to_delete.downcase } to remove matching contacts.

# 2. Edit an Existing Contact
  # Objective: Allow users to update a contact’s phone or email.

    # Implementation:
      # Add a new menu option, e.g., “6. Edit a contact.”
      # Prompt for the name of the contact to edit.
      # If found, ask for the new phone and/or new email. (You can decide if they must enter both or just one.)
      # Update the contact’s details in the array.
      # If not found, display “Contact not found.”

    # Hint: Once you locate the contact (e.g., found_contact), you can reassign properties:
        # found_contact[:phone] = new_phone 
        # found_contact[:email] = new_email

# 3. Partial Name Search
  # Objective: Enhance the search feature so users can find contacts even if they only remember part of a name.
  
    # Implementation:
        # Modify your existing “Search for a contact” option or create a new option, e.g., “7. Partial name search.”
        # Prompt the user for a partial name (e.g., “Jo”).
        # Return any contacts whose names include that string (case-insensitive).
        # If multiple contacts match, display them all; if none match, display “No contacts found.”
    # Hint: Use the String#include? method. For example:
        # contacts.select do |contact| 
        #   contact[:name].downcase.include?(search_name.downcase) 
        # end

#-------------------------------Day 6 - Optional Topics--------------------------------------

# 1. Nested Hashes
# Concepts:
# Hashes within Hashes: A nested hash is a hash that contains other hashes as values. This structure is useful for organizing complex data, like categories that contain multiple items, where each item has its own properties.
# Accessing Nested Data: Accessing data in a nested hash requires multiple levels of keys. Understanding how to navigate these levels helps you retrieve and manipulate nested information effectively.

# Activity:
  # Task: Create a hash representing a library, where each key is a genre (like fiction or nonfiction). The value for each genre is another hash, containing book titles and authors.

# # nested_hashes.rb 
# library = { 
#   fiction: { 
#     "The Great Gatsby" => "F. Scott Fitzgerald", 
#     "1984" => "George Orwell" 
#   }, 
#   nonfiction: { 
#     "Sapiens" => "Yuval Noah Harari", 
#     "Educated" => "Tara Westover" 
#   } 
# } 

# # Accessing and displaying the nested hash data 
# library.each do |genre, books| 
#   puts "#{genre.capitalize} Books:" 
#   books.each do |title, author| 
#     puts " #{title} by #{author}" 
#   end 
# end

# In this example:
  # Data Structure: Each genre is a key in the main library hash. Its value is another hash where keys are book titles, and values are authors.
  # Accessing Nested Hashes: library.each iterates over each genre, then books.each iterates over each book title and author within that genre.
  # This structure can represent various types of hierarchical data, making it easier to store and access grouped information.

# 2. Advanced Hash Methods
    # Concepts:
      # Using Methods Like keys, values, and has_key?:
      # keys returns an array of all keys in the hash.

    # values returns an array of all values.
    # has_key? checks if a specific key exists in the hash. These methods are useful when you want to inspect or work with the elements of a hash without modifying it.

  # Merging Hashes:
      # Merging combines two hashes into one. The merge method returns a new hash with the contents of both, while merge! modifies the original hash directly.

  # Activity:
    # Task: Use advanced hash methods in a file (like about_me.rb or address_book.rb) to explore the functionality of keys, values, has_key?, and merge.

# Example Code:


# # advanced_hash_methods.rb 

# # Defining a hash with personal information 
# person = { 
#   name: "Eve", 
#   age: 29, 
#   city: "Boston" 
# } 

# # Using keys and values 
# puts person.keys # Outputs: [:name, :age, :city] 
# puts person.values # Outputs: ["Eve", 29, "Boston"] 

# # Checking for a specific key 
# if person.has_key?(:age) 
#   puts "Age is available." 
# else 
#   puts "Age is not available." 
# end 

# # Merging additional information into the hash 
# additional_info = { hobby: "Photography", profession: "Engineer" } 
# person.merge!(additional_info) 
# puts person 
# # Outputs: {:name=>"Eve", :age=>29, :city=>"Boston", :hobby=>"Photography", :profession=>"Engineer"}
# In this example:

# Inspecting Keys and Values: person.keys and person.values help retrieve all keys and values without needing to iterate manually.

# Checking for Keys: has_key? lets you verify if specific data (like age) is available, which is helpful when data might be optional.

# Combining Hashes: merge! adds the additional_info hash’s key-value pairs directly into person, allowing you to expand information dynamically.

# These methods allow you to manipulate and retrieve data from hashes more effectively, making your applications more flexible and powerful.

#--------------------------------------Day 7 - Homework--------------------------------------

# Task:

# Project: Build a Student Management System.

# Instructions:

# Create a file named student_management.rb.

# Program Requirements:

# The program should display a menu with options:

# Add a student

# View all students

# Update student grades

# Delete a student

# Exit

# Add a Student:

# Prompt the user for the student's name.

# Prompt for subjects and grades (e.g., enter 'math:90, science:85').

# Store each student as a hash within an array.

# View All Students:

# Display all students with their names and grades.

# Update Student Grades:

# Prompt for the student's name.

# Allow the user to update grades for subjects.

# Delete a Student:

# Prompt for the student's name to delete.

# Example Code Skeleton:

# ruby

# Copy code

# # student_management.rb

# students = []

# def display_menu
#   puts "\nStudent Management Menu:"
#   puts "1. Add a student"
#   puts "2. View all students"
#   puts "3. Update student grades"
#   puts "4. Delete a student"
#   puts "5. Exit"
#   print "Enter your choice: "
# end

# # Implement methods for each functionality...

# loop do
#   display_menu
#   choice = gets.chomp.to_i

#   case choice
#   when 1
#     # Add student code here
#   when 2
#     # View students code here
#   when 3
#     # Update grades code here
#   when 4
#     # Delete student code here
#   when 5
#     puts "Goodbye!"
#     break
#   else
#     puts "Invalid choice. Please try again."
#   end
# end

#-------------------------------------Day 7 - Optional Topics------------------------------

# 1. Deeply Nested Data Access

# Concepts:

# Safely Accessing Data in Nested Structures:

# In real-world data, you may have structures that are deeply nested, such as a user's profile within a larger dataset. Sometimes, parts of the data are missing, which can lead to errors if you try to access nonexistent keys directly.

# To prevent errors when accessing deep keys, Ruby provides the safe navigation operator (&.), which allows you to check for the presence of each nested key without causing an error if a key is missing.

# Activity:

# Task: Use the safe navigation operator (&.) to handle cases where certain nested keys might be missing. This helps prevent errors by providing a default value (e.g., "Unknown") when data isn’t available.

# Example Code:

# ruby

# Copy code

# # safe_navigation.rb 

# data = {
#   user: {
#     profile: { 
#       name: "Alice" 
#       # Note: 'address' key might be missing 
#     } 
#   } 
# } # Using safe navigation to safely access deeply nested data city = data[:user]&.[](:profile)&.[](:address)&.[](:city) || "Unknown" puts "City: #{city}" # Outputs: City: Unknown
# In this example:

# Safe Navigation Operator (&.): data[:user]&.[](:profile)&.[](:address)&.[](:city) tries to access each key step-by-step. If any key doesn’t exist, the result will be nil instead of causing an error.

# Fallback with ||: If the deeply nested key isn’t found, the code provides a default value of "Unknown" by using ||, which returns a specified fallback when nil is encountered.

# This method helps you manage complex data structures gracefully, especially when dealing with optional or missing information.

# 2. Recursion with Nested Data Structures

# Concepts:

# Using Recursive Methods to Traverse Nested Arrays or Hashes:

# Recursion is a technique where a method calls itself to solve a problem. It’s particularly useful for working with data that has a repeating or nested pattern, such as arrays containing other arrays.

# When to Use Recursion: Recursion is useful when you don’t know the depth of nested structures or when the structure is irregular. Each recursive call handles one level, breaking down the problem until a simple solution is reached.

# Activity:

# Task: Write a method that flattens a nested array without using Ruby’s built-in flatten method. The goal is to make each element accessible in a single-level array.

# Example Code:

# ruby

# Copy code

# # recursive_flatten.rb 

# def custom_flatten(array, result = []) 
#   array.each do |element| 
#     if element.is_a?(Array) 
#       custom_flatten(element, result) # Recursive call if element is an array 
#     else 
#       result << element # Add element directly if it's not an array 
#     end 
#   end 
#   result 
# end 

# nested_array = [1, [2, [3, 4], 5], 6] 
# flattened = custom_flatten(nested_array) 
# puts "Flattened array: #{flattened.inspect}" 
# # Outputs: Flattened array: [1, 2, 3, 4, 5, 6]
# In this example:

# Recursive Method (custom_flatten):

# custom_flatten takes two arguments: the array to be flattened and a result array where flattened elements are stored.

# Base Case: If an element is not an array, it’s added to result, ensuring we store each final element directly.

# Recursive Case: If an element is an array, custom_flatten calls itself on that sub-array. This process continues until every nested element is reached and added to result.

# This approach to recursion is essential for handling unpredictable nested data structures and is a foundation for solving more complex recursive problems.

#--------------------------------------Day 8 - Homework-------------------------------

# Task:

# Project: Build a robust user registration system.

# Instructions:

# Create a file named user_registration.rb.

# Program Requirements:

# Prompt the user for a username and password.

# Validate that the username is at least 5 characters.

# Validate that the password is at least 8 characters and contains at least one number.

# Use custom exceptions for validation errors.

# Handle exceptions and prompt the user to try again.

# Ensure that all resources are properly closed if any are used.

#------------------------------------Day 8 - Optional Topics--------------------------------

# 1. Advanced Exception Handling with catch and throw

# Concepts:

# Using catch and throw for Non-Local Flow Control:

# In Ruby, catch and throw provide a way to exit a block of code early, which is especially helpful for breaking out of deeply nested loops or methods.

# Difference Between raise/rescue and catch/throw:

# raise and rescue are for handling errors, while catch and throw are for controlling flow, like exiting a process early without an error.

# throw “throws” a symbol that catch can “catch” to stop execution in the current block, allowing an early exit from nested structures without raising an error.

# Activity:

# Task: Use catch and throw to implement a search that can exit early upon finding a specific value within a nested array.

# Example Code:

# ruby

# Copy code

# # catch_throw_example.rb 

# matrix = [
#   [1, 2, 3], 
#   [4, 5, 6], 
#   [7, 8, 9] 
# ] 

# target = 5 

# # Start catch block with the symbol :found 
# catch(:found) do 
#   matrix.each_with_index do |row, i| 
#     row.each_with_index do |num, j| 
#       if num == target 
#         puts "Found #{target} at position [#{i}][#{j}]" 
#         throw :found # Exit the loop early if target is found 
#       end 
#     end 
#   end 
#   puts "#{target} not found." # This line runs only if target isn't found 
# end
# In this example:

# catch Block: Encapsulates the code you want to exit early. catch(:found) listens for throw :found.

# throw :found: Exits the catch block when called, skipping any code after it in the block. If target is found, it prints its position and stops further iteration.

# Flow Control vs. Error Handling: Here, catch/throw manage flow within the code rather than handling an error, which keeps the code efficient and prevents unnecessary loops.

# This technique can be beneficial for working through complex, nested structures where you want to exit as soon as a condition is met.

# 2. Logging Errors to a File

# Concepts:

# Writing Error Messages to a Log File:

# Logging allows you to keep a record of errors that occur in your program, helping with debugging and understanding recurring issues. By writing errors to a file, you create a persistent log that can be reviewed later.

# Using Timestamps for Log Entries:

# Adding timestamps to each log entry provides a clear timeline of when each error occurred, which can be helpful for diagnosing issues.

# Activity:

# Task: Modify your program to log exceptions to a file named error_log.txt. Each log entry should include a timestamp and the error message.

# Example Code:

# ruby

# Copy code

# # logging_errors.rb 

# begin 
#   # Simulate code that may raise an exception 
#   10 / 0 
# rescue => e 
#   # Open (or create) the log file in append mode 
#   File.open("error_log.txt", "a") do |file| 
#     # Log error with timestamp 
#     file.puts "[#{Time.now}] Error: #{e.message}" 
#   end 
#   puts "An error occurred. Check error_log.txt for details." 
# end
# In this example:

# Opening the Log File in Append Mode: File.open("error_log.txt", "a") opens the file for appending. This means that each new error is added to the end of the file without overwriting previous entries.

# Logging with a Timestamp: Time.now provides the current date and time, making it easy to track when each error occurred.

# Error Message: e.message provides a concise description of the error.

# This setup allows you to keep a detailed record of errors in your program, which is essential for maintaining and troubleshooting applications, especially as they become more complex.

#-------------------------Day 9 - Homework-----------------------------------------

# Task:

# Enhance your contact management program further by:

# Implementing a delete contact feature that updates the file accordingly.

# Adding input validation and error handling for user inputs.

# Allowing the user to update existing contacts.

# Instructions:

# Implement Delete Functionality:

# Allow users to delete a contact.

# Update contacts.json after deletion.

# Implement Update Functionality:

# Allow users to update a contact's information.

# Save changes to contacts.json.

# Add Input Validation:

# Ensure that user inputs are valid (e.g., phone numbers contain only digits).

# Improve Error Handling:

# Handle potential errors gracefully (e.g., trying to delete a non-existent contact).

# Test Your Program:

# Thoroughly test all features to ensure they work as expected.

# Commit Your Work to GitHub:

# Push your updated contact_list.rb and contacts.json to your repository.

#------------------------------Day 9 - Optional Topics------------------------------------

# 1. Parsing CSV Files

# Concepts:

# Using the CSV Library to Read and Write CSV Files:

# CSV (Comma-Separated Values) is a common file format used for storing tabular data. The Ruby CSV library provides methods for reading from and writing to CSV files, allowing easy integration of data into applications.

# Converting Data Between CSV and Ruby Arrays/Hashes:

# Reading from CSV: The CSV library reads each line in the file as an array of values. This can be converted into hashes to provide labeled data.

# Writing to CSV: When writing data to a CSV file, you can format each entry as an array or as fields in a row. This enables structured data storage and compatibility with other programs that support CSV.

# Activity:

# Task: Modify your contact management program to store and retrieve contacts from a CSV file instead of a JSON file. This involves saving each contact's details as a row in the CSV file.

# Example Code:

# ruby

# Copy code

# require 'csv' 

# # Saving contacts to CSV 
# CSV.open("contacts.csv", "w") do |csv| 
#   csv << ["Name", "Phone", "Email"] # Optional: Add header row 
#   contacts.each do |contact| 
#     csv << [contact['name'], contact['phone'], contact['email']] 
#   end 
# end 

# # Loading contacts from CSV 
# contacts = [] 
# if File.exist?("contacts.csv") 
#   CSV.foreach("contacts.csv", headers: true) do |row| 
#     contacts << { 'name' => row['Name'], 'phone' => row['Phone'], 'email' => row['Email'] } 
#   end 
# end
# In this example:

# Saving to CSV:

# The program opens (or creates) contacts.csv in write mode with CSV.open("contacts.csv", "w").

# Each contact is written as a new row, with name, phone, and email stored in separate columns. If you want to include headers, add ["Name", "Phone", "Email"] as the first line.

# Reading from CSV:

# CSV.foreach("contacts.csv", headers: true) reads each row and automatically maps values to the header names, creating a hash for each row.

# Each row is then converted to a contact hash and added to the contacts array.

# This approach makes it easy to store and retrieve structured data, and the CSV format ensures compatibility with spreadsheets and other data tools.

# 2. Using YAML for Data Serialization

# Concepts:

# Understanding the YAML Format:

# YAML (YAML Ain’t Markup Language) is a human-readable data serialization format commonly used for configuration files. It is similar to JSON but easier to read and write for humans.

# YAML’s hierarchical structure (using indentation) makes it ideal for representing nested data.

# Reading and Writing YAML Files in Ruby:

# The Ruby YAML module allows easy conversion of data to and from YAML format. This enables saving complex data structures (like arrays and hashes) in a readable format that can be edited manually if needed.

# Activity:

# Task: Update your contact management program to save and load contacts using YAML instead of JSON. YAML’s readable format makes it easier to view and edit data directly.

# Example Code:

# ruby

# Copy code

# require 'yaml' 

# # Saving contacts to YAML 
# File.open("contacts.yml", "w") do |file| 
#   file.write(contacts.to_yaml) 
# end 

# # Loading contacts from YAML 
# if File.exist?("contacts.yml") 
#   contacts = YAML.load_file("contacts.yml") 
# end
# In this example:

# Saving to YAML:

# contacts.to_yaml converts the contacts array to a YAML-formatted string.

# File.open("contacts.yml", "w") opens (or creates) contacts.yml in write mode, saving the YAML data.

# Loading from YAML:

# YAML.load_file("contacts.yml") reads and parses the file, converting the YAML data back into a Ruby array of hashes (restoring the original structure of contacts).

# This allows for easy persistence of complex data structures in a format that’s both programmatically accessible and human-readable. YAML is particularly useful for settings or data files that might be edited outside of the application.
  
#--------------------------Day 10 - Homework--------------------------------------

# Assignment:
# Enhance contact_list.rb:

#Implement search functionality using Enumerables (select).
  #Add error handling for user input (e.g., empty inputs).
  #Ensure all file operations are properly handled.
  #Optionally, export contacts to a CSV file.

# Submission:

#Commit your updated program to GitHub.
#Ensure your code is well-documented and formatted.
#Career Services Homework:

# Update your LinkedIn profile.

# Prepare questions about personal branding or LinkedIn for the next session.
  
# Day 10 - Optional Topics

# 1. Introduction to Lambda and Proc

# Concepts:

# Understanding Lambdas and Procs:

# Lambdas and Procs are two ways to create blocks of code that you can store in variables, pass around, and reuse. They allow for flexibility in defining small bits of functionality that can be executed at a later time.

# Lambda: A lambda is a way to define a method-like structure without giving it a name. Lambdas are strict about the number of arguments you pass—they will throw an error if you pass the wrong number of arguments.

# Proc: A proc (short for "procedure") is similar to a lambda but is more lenient with arguments. If you pass too few arguments, the missing ones are simply set to nil.

# Differences Between Lambdas and Blocks:

# Unlike regular blocks in methods, lambdas and procs can be saved to variables and reused multiple times.

# They behave similarly, but lambdas have strict argument checking (like methods), while procs do not.

# Another key difference: return inside a lambda only exits from the lambda, whereas in a proc, return will exit the whole method where the proc is called.

# Activity:

# Task: Rewrite some of your Enumerable methods using lambdas instead of regular blocks. This will help you get comfortable with creating reusable blocks of code and passing them as arguments to methods.

# Example Code:

# ruby

# Copy code

# # lambda_example.rb 

# # Define a lambda to multiply a number by two 
# multiply_by_two = ->(number) { number * 2 } 

# numbers = [1, 2, 3, 4, 5] 

# # Use the lambda with an Enumerable method 
# doubled_numbers = numbers.map(&multiply_by_two) 

# puts "Doubled numbers: #{doubled_numbers.inspect}"
# In this example:

# The lambda multiply_by_two is created using -> syntax. It takes one argument, number, and returns number * 2.

# numbers.map(&multiply_by_two) applies the lambda to each element in numbers, resulting in each number being doubled.

# The & before multiply_by_two converts the lambda into a block that map can use.

# Using lambdas allows you to reuse small code snippets and pass them around easily, enabling cleaner and more modular code.

# 2. Using the Enumerator Class

# Concepts:

# Creating Custom Enumerators:

# An Enumerator is an object that can produce a sequence of values, allowing you to control and define custom behavior for generating values.

# Enumerators can be finite or infinite—producing values on demand and continuing until explicitly stopped.

# You can create an enumerator using Enumerator.new and define how it should generate values.

# Chaining Enumerables:

# Enumerators work well with other Enumerable methods. By chaining methods like take, select, or map, you can further control and filter the sequence generated by an enumerator.

# Activity:

# Task: Create an enumerator that generates an infinite sequence of even numbers greater than 100. Use this enumerator to find the first ten even numbers in this sequence.

# Example Code:

# ruby

# Copy code

# # enumerator_example.rb 

# # Create an enumerator to generate infinite even numbers starting from 101 
# infinite_numbers = Enumerator.new do |yielder| 
#   number = 101 
#   loop do 
#     yielder << number if number.even? # Yield number if it is even 
#     number += 1 
#   end 
# end 

# # Use the enumerator to take the first ten even numbers greater than 100 
# first_ten_even_numbers = infinite_numbers.take(10) 

# puts "First ten even numbers greater than 100: #{first_ten_even_numbers.inspect}"
# In this example:

# The infinite_numbers enumerator is created with Enumerator.new, which takes a block defining how to generate the sequence.

# Inside the block, the yielder << number statement yields values one at a time to the enumerator. Only even numbers are yielded.

# number increments indefinitely due to the loop statement, creating an infinite sequence.

# The take(10) method is then used to get the first 10 even numbers in the sequence generated by infinite_numbers.

# This example demonstrates how enumerators can produce complex sequences on demand and be combined with Enumerable methods for fine-tuned control over data.