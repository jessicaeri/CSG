# ------ 1/20/2025: Variables --------
# Question of the day: What is one piece of tech I cannot live without?
# My answer: Google bc I look up everything and anything.

# Hotkey of the day: Cmd (apple) or Alt (windows) tab - cycles through different applications open

# TEAM NAME: Chamorro Chips!!!!!

# # string 
# name = "Jessica"
# puts name 
# puts name.class

# # Integer
# number = 26
# puts number 
# puts number.class 

# #Float 
# decimal = 5.25
# puts decimal 
# puts decimal.class

# #Boolean 
# boolean = true
# puts boolean 
# puts boolean.class

# #Sentence
# puts "My name is #{name}." + " I am #{number} years old." + " I am #{decimal} feet tall. All of this is information is #{boolean}." 

# Arithmetic
# a = 9.to_f #.to_f enables decimal rather than a whole number 
# b = 26.to_f
# puts "#{a+b}"
# puts "#{a-b}"
# puts " #{a*b}"
# puts "#{a/b}"

# # MODULO (%) gives remainder of division operation 
# Remainder = 10 % 3 #basically 10/3 remainder = 1 bc 3 fits in 10 3 times with remainder 1
# puts Remainder 

# #example of modulo
# number =29
# if number % 2 ==0
#   puts "Even number."
# else
#   puts "Odd number."
# end

# # gets.chomp
# name = gets.chomp #chomp basically removes the line break.
# sentence = "That is a cool #{name}, where'd you learn that?"
# puts sentence

# puts "Hi, \n how are you?"


# if number % 2 ==0
#   puts "Even number."
# else
#   puts "Odd number."
# end

# # ?????? RETURN BACK ????????
# if number.to_s == number
#   if number % 2 == 0
#     puts "Even number."
#   else
#     puts "Odd number."
#   end
# else number.to_s != Integer
#   puts "Sorry, please provide an integer."
# end

#Simple calculator
#ask user for two numbers
#ask for an operation (add, subtract, multiply, divide)
#perform operation and print result

# puts "Please type a number."
# n1 = gets.chomp.to_f

# puts "Please type a second number."
# n2 = gets.chomp.to_f

# puts "Would you like to add, subtract, multiply, or divide?"
# operation = gets.chomp
# puts operation

# if operation.downcase == "add"
#   puts n1 + n2
# elsif operation.downcase == "subtract"
#   puts n1 - n2
# elsif operation.downcase == "multiply"
#   puts n1 * n2 
# elsif operation.downcase == "divide"
#   puts n1/n2
# else
#   puts "Not a valid operation."
# end

