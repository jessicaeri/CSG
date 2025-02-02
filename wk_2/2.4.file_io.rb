# --------------------- DAY  9: File input and output (io) -------------------------------

# Question of the Day: Cool tech as of late??
# CHOMPSHOP!!! - kids rotary tool 
# ToyBox Lab - kids 3d printer that teaches coding/CAD software
# Notebooklm - AI software learning tool

#Hotkey of the day: SHFT CMD ENTER inserts a new blank line above your current line and moves your cursor onto it

#--------------------------------------------------------------------------------

#Reading a specific file "r"
# begin
#   file = File.open("read_file_cat_ascii.txt", "r") #"r" = read #only works in the folder you are currently in UNLESS you specify where its at
#   # if you want to find a specifc folder you'd
  
#       # 1. ls #shows files 
#       # 1.1.variables.rb          1.5.todo_list.rb          hw2_loop_pract.rb         string_manip.rb
#       # 1.2.bigO.rb               adv_cond.rb               menu_loop.rb
#       # 1.3.arrays.rb             favorite_colors.rb        rectangle_area.rb
#       # 1.4.method.rb             hw1_simple_calculator.rb  shopping_list.rb

#       # 2. pwd #prints workign directorty (location)
#       # /Users/jessicafernandez/Desktop/CSG/wk_1

#       # 3. copy and paste into where example.txt is 
#       # /Users/jessicafernandez/Desktop/CSG/wk_1/favorite_colors.rb
  
#   #be careful with using captilaized variables/naming them bc ruby has built in functions with capitalized words
#   contents = file.read #reads contents of the file
#   puts contents 
# rescue Errno::ENOENT #basically means files do not exist
#   puts "File not found"
# ensure
#   file.close if file
# end

# Hello!! JESHKA!

#        _..---...,""-._     ,/}/)
#      .''        ,      ``..'(/-<
#     /   _      {      )         \
#    ;   _ `.     `.   <         a(
#  ,'   ( \  )      `.  \ __.._ .: y
# (  <\_-) )'-.____...\  `._   //-'
#  `. `-' /-._)))      `-._)))
#    `...'         hjw


#             __..--''``---....___   _..._    __
#  /// //_.-'    .-/";  `        ``<._  ``.''_ `. / // /
# ///_.-' _..--.'_    \                    `( ) ) // //
# / (_..-' // (< _     ;_..__               ; `' / ///
#  / // // //  `-._,_)' // / ``--...____..-' /// / //

# ,-.       _,---._ __  / \
# /  )    .-'       `./ /   \
# (  (   ,'            `/    /|
# \  `-"             \'\   / |
#  `.              ,  \ \ /  |
#   /`.          ,'-`----Y   |
#  (            ;        |   '
#  |  ,-.    ,-'         |  /
#  |  | (   |        hjw | /
#  )  |  \  `.___________|/
#  `--'   `--'

#------------ ERROR HANDLING ----------------------------
# begin
#   file = File.open("example.txt", "r") #only works in the folder you are currently in UNLESS you specify where its at
  
#   #be careful with using captilaized variables/naming them bc ruby has built in functions with capitalized words
#   contents = file.read #reads contents of the file
#   puts contents 
# rescue Errno::ENOENT #basically means files do not exist
#   puts "File not found"
# ensure
#   file.close if file #if file EXISTS then close the file
#   #HIGHLY IMPORTANT
#   #bc it could be a large file, etc. etc. etc. 
# end
# #File not found

#--------------------------------------------------------------------------------

#Write/add a specific file "w"
#   we do not need to create a file prior to this function. If it does not match any file names within folder it creates it for you OR rewrites the file.

# begin
#   file = File.open("write_file.txt", "w")
#   file.puts "Hello this is your new file."
#   puts "Data written to write_file.txt."
# rescue IOError => e
#   puts "An error occurred: #{e.message}"
# ensure
#   file.close if file
# end

# Hello this is your new file.
#\\Data written to write_file.txt.


#--------------- EXERCISE-------------------------------------

# Task: Write user input to a file.
# Instructions:
# Create a Ruby script named file_io.rb. #changes to "write_user_message.txt"
# Prompt the user for their name and a message.
# Write this information to a file named user_messages.txt.
# Ensure proper error handling and closing of the file.

# begin 
#   puts "Please write your name:"
#   user_name = gets.chomp 
#   puts "Please write a message:"
#   user_message = gets.chomp 

#   file = File.open("write_user_message.txt", "w")
#   file.puts "#{user_name}"
#   file.puts "#{user_message}"
#   puts "Message written into write_user_message.txt"
# rescue IOError => e
#   puts "An error occured:#{e.message}"
# ensure 
#   file.close if file
# end

# Please write youre name:
# Jessica Eri
# Please write a message:
# BUENAS YAN HAFA ADAI!!!
# Message written into write_user_message.txt

#--------------------------------------------------------------------------------

#APPEND "a" - adding new data to existing file 
#     However, if the file could not be found it would create a new
#     Whether or not exist it WILL write to a file

# begin 
#   puts "Please write your brother's name:"
#   user_name = gets.chomp 
#   puts "Please write a message:"
#   user_message = gets.chomp 

#   file = File.open("write_user_message.txt", "a")
#   file.puts "#{user_name}"
#   file.puts "#{user_message}"
#   puts "Your new data has been entered into write_user_message.txt"
# rescue IOError => e
#   puts "An error occured:#{e.message}"
# ensure 
#   file.close if file
# end

# output:
#~/Desktop/CSG/wk_2 % ruby 2.4.file_io.rb
# Please write your name:
# Jessica Eri     
# Please write a message:
# # BUENAS YAN HAFA ADAI!!!
# Message written into write_user_message.txt
# Please write your brother's name:
# Joshua Edward
# Please write a message:
# He is ugry!
# Your new data has been entered into write_user_message.txt

# File now:
# Jessica Eri 
# BUENAS YAN HAFA ADAI!!!
# Joshua Edward
# He is ugry!

#Reading each line within a file - file.each_line do |line|

# begin
#   file = File.open("write_user_message.txt", "r")
#   file.each_line do |line|
#     puts "Read line: #{line.chomp}"
#   end
# rescue Errno::ENOENT
#   puts "File not found."
# ensure
#   file.close if file
# end

# Read line: Jessica Eri 
# Read line: # BUENAS YAN HAFA ADAI!!!
# Read line: Joshua Edward
# Read line: He is ugry!

#---------------------------------- EXERCISE -----------------------------------

# Task: Count the number of lines in a file.
# Instructions:
# Create a file named data.txt with several lines of text.
# Read the file and count the number of lines.
# Display the total line count.
# Include error handling for file not found.

# line_count = 0
# begin
#   file = File.open("address_book.rb", "r")
#   file.each_line do |line|
#     line_count += 1
#   end
#   puts "Total number of lines: #{line_count}"
#   # File.foreach("address_book.rb").count
# rescue Errno::ENOENT
#   puts "File not found."
# ensure
#   file.close if file
# end

#\\Total number of lines: 254

#----------------------------------------------------------------------------------

#Running two functions at a time!!!!!!!!!!!!!
# "r+" - read and write ----------------------------

# begin
#   # Open an existing file for reading and writing.
#   # The file pointer starts at the beginning of the file.
#   file = File.open("example.txt", "r+")

#   puts "Original file content:"
#   # Read the file's entire content (the pointer moves to the end).
#   puts file.read

#   # Move the file pointer back to the start, so we can overwrite.
#   file.rewind

#   # Overwrite content with new text.
#   file.puts "This is new content overwriting the old!"

#   puts "File content has been overwritten."
# rescue Errno::ENOENT
#   puts "File not found."
# ensure
#   file.close if file
# end

# "a+" - append and read --------------------------------

# begin
#   # "a+" opens the file for reading AND appending.
#   # If the file doesn't exist, it creates one.
#   file = File.open("example.txt", "a+")

#   # Go back to the start of the file to read what's currently there
#   file.rewind
#       #bc append is to add at the end we would need to "rewind" to the front first 
#       to read then add whatever to the end 


#   puts "Current file content:"
#   puts file.read

#   # Append new data at the end
#   file.puts "Appending new data at #{Time.now}"

#   # Confirm changes by reading again
#   file.rewind
#   puts "\nUpdated file content:"
#   puts file.read
# rescue Errno::ENOENT
#   puts "File not found."
# ensure
#   file.close if file
# end

#------------------------------------------------------------------------------

# require 'json' #java script object notation - allows you to use the json library. we can use the json gen and its function. 
# #RUBY ON RAILS RUNS DIFFERENTLY!!!!
# #can have arrays, hashes, etc. 

# data = {
#   name: "Alice",
#   age: 30,
#   hobbies: ["reading", "hiking", "coding"]
# } 

# begin
#   file = File.open("data.json", "w") #.json
#   file.write(JSON.pretty_generate(data)) #now that JSON is written we can
#   #.pretty_generate will make the data look nicer
#   #without pretty generate it did not print the data into file bc the data doesn't fit into the JSONS "style"
#   puts "Data saved to data.json."
# rescue IOError => e
#   puts "An error occurred: #{e.message}"
# ensure
#   file.close if file
# end

# Output in JSON file:
# {
#   "name": "Alice",
#   "age": 30,
#   "hobbies": [
#     "reading",
#     "hiking",
#     "coding"
#   ]
# }

#------------------------------EXERCISE --------------------------------------------
# Task: Save an array of hashes to a file in JSON format.
# Instructions:
# Create a Ruby script named save_contacts.rb.
# Define an array of hashes representing contacts.
# Write the array to a file named contacts.json in JSON format.
# Ensure proper error handling.

require 'json'

contacts = [
  { name: "Bob", phone: "555-1234", email: "bob@example.com" },
  { name: "Carol", phone: "555-5678", email: "carol@example.com" }
] 

# #JSON w/ pretty generates
begin
  file = File.open("save_contacts.json", "w") 
  file.write(JSON.pretty_generate(contacts)) 
  puts "Data saved to data.json."
rescue IOError => e
  puts "An error occurred: #{e.message}"
ensure
  file.close if file
end

# #JSON w/o pretty generates
# begin
#   file = File.open("save_contacts.json", "w") 
#   # file.write(JSON.pretty_generate(contacts)) 
#   file.puts "#{contacts}"
#   puts "Data saved to data.json."
# rescue IOError => e
#   puts "An error occurred: #{e.message}"
# ensure
#   file.close if file
# end

# [{:name=>"Bob", :phone=>"555-1234", :email=>"bob@example.com"}, {:name=>"Carol", :phone=>"555-5678", :email=>"carol@example.com"}]

# new_contact = { name: "Ruby", phone: "555-5678", email: "carol@example.com" }

# begin
#   file = File.open("save_contacts.json", "a+")
#   file.rewind
#   puts "Current file content:"
#   puts file.read

#   # Append new data at the end
#   file.write(JSON.pretty_generate(new_contact)) #if I do it this way it does not add into the existing hash
#    #If you wanted to add into the array try LOOP and EACH  so that when it comes to the line it would add
#     LOOK AT LINE 408


#   # Confirm changes by reading again
#   file.rewind
#   puts "\nUpdated file content:"
#   puts file.read
# rescue Errno::ENOENT
#   puts "File not found."
# ensure
#   file.close if file
# end

# Data saved to data.json.
# Current file content:
# [
#   {
#     "name": "Bob",
#     "phone": "555-1234",
#     "email": "bob@example.com"
#   },
#   {
#     "name": "Carol",
#     "phone": "555-5678",
#     "email": "carol@example.com"
#   }
# ]

# Updated file content:
# [
#   {
#     "name": "Bob",
#     "phone": "555-1234",
#     "email": "bob@example.com"
#   },
#   {
#     "name": "Carol",
#     "phone": "555-5678",
#     "email": "carol@example.com"
#   }
# ]{
#   "name": "Ruby",
#   "phone": "555-5678",
#   "email": "carol@example.com"
# }

#----------------------------------------------------------------------------------

#READING JSON FILES
# require 'json'

# begin
#   file = File.open("save_contacts.json", "r") #I want to read the JSON File
#   contacts = JSON.parse(file.read) #parse - basically reads it for json
#   puts "Contacts loaded:" #I want to read the json file and print it out nicely
#   contacts.each do |contact| #takes care of the ZERO
#     puts "Name: #{contact['name']}, Phone: #{contact['phone']}, Email: #{contact['email']}" #pay attention to if data is inputted as 
#       # Strings - QUOTES "example": "Jess" OR 
#       # Symbols - COLONS example: "Jess"
#   end
# rescue Errno::ENOENT
#   puts "File not found."
# rescue JSON::ParserError
#   puts "Error parsing JSON data."
# ensure
#   file.close if file
# end
#\\ Contacts loaded:
# Name: Bob, Phone: 555-1234, Email: bob@example.com
# Name: Carol, Phone: 555-5678, Email: carol@example.com

#----------- PRACTICAL USAGE-----------
#we would prefer using data as a json so that we can use\see the data better. JSON databases are faster and have more storage flexibility

#------------------------------ EXERCISE ------------------------------------------------

#Pair programming - 
#   drivers - on the computer 
#   writer - tellign driver what to do

contacts = []

require 'json'

begin
  file = File.open("save_contacts.json", "r") #I want to read the JSON File
  contacts = JSON.parse(file.read, symbolize_names: true) #sym_names = basically converts everything into symbols
  puts "Contacts loaded:" #I want to read the json file and print it out nicely
  contacts.each do |contact| #takes care of the ZERO
    puts "Name: #{contact['name']}, Phone: #{contact['phone']}, Email: #{contact['email']}" #pay attention to if data is inputted as 
      # Strings - QUOTES "example": "Jess" OR 
      # Symbols - COLONS example: "Jess"
  end
rescue Errno::ENOENT
  puts "File not found."
rescue JSON::ParserError
  puts "Error parsing JSON data."
ensure
  file.close if file
end

loop do
  puts "\nContact List Menu:"
  puts "1. Add contact"
  puts "2. Remove contact"
  puts "3. View contacts"
  puts "4. Exit"
  puts "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    puts "Enter contact name: "
    name = gets.chomp
    puts "Enter contact phone number: "
    phone = gets.chomp
    puts "Enter contact email: "
    email = gets.chomp
    contacts.push({ name: name, phone: phone, email: email })
    puts "Contact added."
  when 2
    puts "Enter contact name to remove: "
    name = gets.chomp
    contact = contacts.find { |c| c[:name] == name }
    if contact
      contacts.delete(contact)
      puts "Contact removed."
    else
      puts "Contact not found."
    end
  when 3
    puts "Contact List:"
    contacts.each_with_index do |contact, index|
      puts "#{index + 1}. #{contact[:name]} - #{contact[:phone]} - #{contact[:email]}"
    end
  when 4
    puts "Goodbye!"
    break
  else
    puts "Invalid choice. Please try again."
  end
end