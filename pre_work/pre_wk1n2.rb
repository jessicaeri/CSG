# name = "Jess"
# age = 26
# height = 63
# is_student = true
# puts name
# puts age
# puts height
# puts is_student
# #CONCATENATION
# puts "My name is " + name
# puts "I am #{age} years old."
# hobby = "DIY anything and everything."
# fun_fact = "My dream job is to be a folie artist."
# #INTERPOLATION #{xyz}
# puts "My name is " + name + "I am #{age} years old" + "My current hobby is to " + hobby + fun_fact
# puts "My name is #{name}." + "I am #{age} years old. " + "My current hobby is to #{hobby}"+ fun_fact
# is_raining = true
# if is_raining = true
#   puts "bring umbrella"
# else
#   puts "don't bring umbrella"
# end


#PART B {|| x} - means loop
# (1..20).each { |num| puts num } 
# ('a'..'d').each { |char| puts char }
# ('a'..'z').each { |char| puts char }
#TASK REVERSE range 

# #FIGURET HIS OUT
# puts "Give me a number and I'll double it:"
# input = gets.chomp
# converted_input = inpute.to_i

# puts "Enter a number:" 
# # ACTUALLY ENTER NO.INTO ITERM
# input = gets.chomp 
#     #  gets.chomp any string after input gets printed on same line
# num = input.to_i 
# puts ("Double is #{num * 2}")

# range = (1..5).to_a
# sum = range.sum
# puts sum

# ------ DAY 2:  Operations, Strings, and Basic Math -------
#Exercise 1: Simple Calculator
# a = 9
# b = 26
# sum = a + b 
# difference = a - b 
# product = a * b 
# quotient = a/b.to_f
# puts "Sum: #{sum}, Difference: #{difference}, Product: #{product}, Quotient: #{quotient}"
# puts Float(quotient) #why isn't it printing as 0.36?
# puts quotient

#Exercise 2: String Introduction
# f_name = "Jessica Eri"
# l_name = "Fernandez"
# hobby = "DIY-ing"

# puts "My name is " + f_name + " " + l_name + ". I enjoy " + hobby + "." 
# puts "My name is #{f_name} #{l_name}. I enjoy #{hobby}."

# apples = 5
# bananas = 3
# sum = apples + bananas
# puts "I have #{sum} total fruits"

#Part B: Enhanced Conditionals with Logical Operators

#exercise 
# puts "Enter your age: " 
# age = gets.chomp.to_i 
# #gets.chomp single line to_i interger

# puts "Enter your city:" 
# city = gets.chomp.downcase 

# puts "Do you have an ID?"
# id = gets.chomp.downcase

# # ?????? if age >= 18 && city == "Yigo" && id=="Yes"?????
#   puts "Eligible" 
# else 
#   puts "Not eligible" 
# end

# puts "Your age is #{age} and live in #{city}!"

# puts "What time (hour) is it?"
# time = gets.chomp.to_i

# if time <= 5 && time < 12
#   puts “Good morning”
# elsif time <= 12 && time < 28
#   puts “Good afternoon”
# elsif time <= 18 && time < 22
#   puts “Good evening”
# else 
#   puts “Good night”
# end
 
## ------ DAY 2:  Operations, Strings, and Basic Math -------
#Part A: If/Else Control Structures
# puts "Enter a number:" 
# number = gets.chomp.to_i 

# if number > 0 
#   puts "Positive." 
# elsif number < 0 
#   puts "Negative." 
# else 
#   puts "Zero." 
# end

# puts "What is your age?"
# age = gets.chomp.to_i

# if age >= 18
#   puts "You can watch the movie."
# else
#   puts "You are too young."
# end

# puts "Do you have your license?"
# has_id = gets.chomp

# if age >= 18 && has_id.downcase == "yes"
#   puts "You can watch the movie."
# else
#   puts "You cannot watch the movie."
# end

#Part B: Advanced Looping Techniques (loop, break, next)
#simple loops
#loop (input) do #continue to loop UNTIL condition is met if it does not say "break" it will continue forever until it crashes CTRL C will make it stop

# 3.times do
#   puts "Hello"
# end #=> Hello Hello Hello

# n=0
# while n < 10 
#   puts n 
#   n = n+1
# end
# #continues until before 10 basically breaks WHILE the statement is true

# n = 0
# until n== 10
#   puts "Hello"
#   n +=1 #n = n+1
# end #prints out until n ==1

#exercise
# secret = rand(1..10) #random no selected within 1 to 10; set secret to random no
# guess = nil #nil means nothing undefined; set guess to nil
# count = 0 

# loop do
# until guess == secret #random no is selected; conditional that will keep running until guess == secret
#   puts "Guess a number between 1 and 10:" #prompting user to guess a no
#   guess = gets.chomp.to_i #setting guess to the user's number

#   if guess < secret #conditional to check if guess less than secret
#     puts "Too low!" #print out too low
#   elsif guess > secret #conditional to check if guess more than secret
#     puts "Too high!" #print out too low
#   else #if neither conditional is met, it goes here
#     puts "Correct! The number was #{secret}." #prints out
#   end #
#   #break #allows for loop to STOP
#   count += 1
#   if count == 3
#     break
#   end
#   break
# end #break
# # if guess == secret
# #   puts "Do you want to play again"
# # end

# Day 4: Loops for Repetition

# Part A: Loops for Repetition
# Reading & Explanation
# While Loop:

# count = 1 
# while count <= 5 #stops count at 5
#   puts count 
#   count += 1 #adds count after every trial 
# end
# Times Loop:

# 3.times { puts "Hello!" }
# For Loop:

# for i in 1..5  #lists the range
#   puts i #prints range
# end
# Exercise 1: Basic Loops
# Task: Practice each loop type.

# Reflect: Which loop is best for counting vs. repeating a phrase?
#   Times for counting; while for repeating phrase

# Exercise 2: User-Driven Loop
# Task: Ask the user to type something; print it back. Stop if they type "stop":

# input = "" 
# while input != "stop" 
#   puts "Type something (or 'stop' to quit):" 
#   input = gets.chomp 
#   puts "You typed: #{input}" unless input == "stop" 
# end 
# puts "Program ended."
# Notice: The loop runs until "stop" is typed.

# Additional Practice

# Write a loop to sum numbers from 1 to 10 and print the result.

# ?????? HELP ????
# sum = 0 
# i = 1
# while (i <= 10)
#   print i
#   sum = sum + 1 # 0 +1; 1 + 2 (i+1)
#   i = i + 1 #creates every "step"
# end while
# print sum

# Part B: Nested Arrays and Hashes
# Reading & Explanation
# Nested Arrays: Arrays inside arrays (like a matrix).

# Nested Hashes: Hashes inside hashes (e.g., a contact list with phone, email).

# Exercise 1: Matrix Manipulation
# matrix = [ 
#   [1,2,3], 
#   [4,5,6], 
#   [7,8,9] 
# ] 

# matrix.each do |row| 
#   row.each { |num| print "#{num * 2} " } 
#   puts 
# end
# Task: Try different operations ( square each number).
# matrix = [ 
#   [1,2,3], 
#   [4,5,6], 
#   [7,8,9] 
# ] 

# matrix.each do |row| 
#   row.each { |num| print "#{num **2 } " } 
#   puts 
# end
# ????? Experiment: Print in a neat grid or sum each row.

# Exercise 2: Contact List (Nested Hash)
# contacts = { 
#   "Alice" => { phone: "123-4567", email: "alice@example.com" }, 
#   "Bob" => { phone: "987-6543", email: "bob@example.com" } 
# } 

# puts "Enter a contact name:" 
# name = gets.chomp
# if contacts.has_key?(name) 
#   puts "#{name}'s phone: #{contacts[name][:phone]}" 
#   puts "#{name}'s email: #{contacts[name][:email]}" 
# elsif
#   puts "Contact not found.""
# end
# Task: Let users add a new contact if it doesn’t exist.????????????

# contacts = { 
#   "Alice" => { phone: "123-4567", email: "alice@example.com" }, 
#   "Bob" => { phone: "987-6543", email: "bob@example.com" } 
# } 

# puts "Enter a contact name:" 
# name = gets.chomp
# if contacts.has_key?(name) 
#   puts "#{name}'s phone: #{contacts[name][:phone]}" 
#   puts "#{name}'s email: #{contacts[name][:email]}" 
# elsif
#   puts "Contact not found. Would you like to add a new contact?"
#   if input = "yes"
#   new_name = gets.chomp
#   new_phone = gets.chomp.to_i
#   new_email = gets.chomp
#   else input != "yes"
#     puts "Have a great day!"
#   end
# end

# ?????? Bonus: Allow updating a contact’s phone/email if it does exist.

