# --------------------- DAY  8: ERROR HANDLING -------------------------------

# Question of the Day: Are you a planner or a spontaneous person?
# bothhhhhh... I like planning but if something goes off the rails then its fine.

#Hotkey of the day: Cmd/Ctrl + open or close square brackets - moves all highlighted code one tab to the right or left

#---------------------------------------------------------------------------------------

#syntax error

#puts "Hello world
# 2.3.error_handling.rb:12: unterminated string meets end of file (SyntaxError)(underlines # d") showing that a " needs to be added.

# student = {
#   name: "Alice",
#   grades: {
#     math: 90,
#     literature: 87,
#     science: 66
#   },
#   contact: {
#     email: "alice@gmail.com",
#     phone: "123-456-789"
#   #missing curly bracket
# }
#2.3.error_handling.rb:26: syntax error, unexpected end-of-input, expecting '}' (SyntaxError)

#runtime exception 
# puts 10/0 #2.3.error_handling.rb:30:in `/': divided by 0 (ZeroDivisionError)from 2.3.error_handling.rb:30:in `<main>'
# puts 10/2

#begin: starts a block of code that might raise an exception
#rescue: catches specific exceptions and allows you to handle them 
#ensure: code that runs whether an exception occured or not.

# def divide_no(a, b)
#   begin 
#     result = a / b
#   rescue ZeroDivisionError #(this makes it more specific)
#     puts "Error: cannot divide by zero."
#     result = nil
#    rescue TypeError
#     puts "Error: please ensure this is an integer."
#     result = nil
#   ensure  
#     puts "Division attempt completed."
#   end
#   return result
# end

# puts divide_no(10, 0)
# Error: cannot divide by zero.
# Division attempt completed.

# puts divide_no(10, 2)
# Division attempt completed.
# 5

#----------------------------EXERCISE----------------------------------------

#Task: Create a safe division method.
# Instructions:
# Create a file named error_handling.rb.
# Write a method that takes two numbers and divides them.
# Use begin and rescue to handle ZeroDivisionError.
# Use ensure to print a message indicating the operation is complete.

# def divide_no(a , b)
#   begin
#     result = a/b
#   rescue ZeroDivisionError
#     puts "Error: Cannot divide by Zero"
#     result = nil 
#   end
#   puts "Division completed answer is: #{result}"
# end

# divide_no(10, 5)
# # Division completed answer is: 2

# divide_no(10, 0)
# # Error: Cannot divide by Zero
# # Division completed answer is: 

#without specific error
# def divide_no(a , b)
#   begin
#     result = a/b
#   rescue 
#     puts "Error: Cannot divide by Zero"
#     result = nil 
#   end
#   puts "Division completed answer is: #{result}"
# end

# divide_no(10,5)
# # Division completed answer is: 2

# divide_no(10,0)
# # Error: Cannot divide by Zero
# # Division completed answer is: 


#multiple rescue blocks
def divide_no(a , b)
  begin
    result = a/b
  rescue ZeroDivisionError
    puts "Error: Cannot divide by Zero"
    result = nil 
  rescue TypeError
    puts "Error: Please input integer "
    result = nil 
  rescue 
    puts "Error:"
    result = nil 
  end
  puts "Division completed answer is: #{result}"
end

# divide_no(10,2)
# # Division completed answer is: 5

# divide_no(10,0)
# # Error: Cannot divide by Zero
# # Division completed answer is: 

# divide_no(10,-1)
# # Division completed answer is: -10

# divide_no(10, "a")
# # Error: Please input integer 
# # Division completed answer is: 

# divide_no(10, 2.5)
# # Division completed answer is: 4.0

# divide_no(10, t)
# "2.3.error_handling.rb:139:in `<main>': undefined local variable or method `t' for main:Object (NameError)

# divide_no(10, t)"

#SOLUTION
# begin
#   puts divide_no(10, t)
#   puts divide_no(10,2)
# rescue NameError #name error here BC it wouldn't even go through line 106 through 150 LOOK AT LINE152
#   puts "Error: There was an issue with the parameters you passed."
# end

# puts divide_no(10, t) #error is being ran at 152 automatically bc it does not meet the parameters of the input. Once the parameters are met, then it  goes through line 106-150

# # 2.3.error_handling.rb:152:in `<main>': undefined local variable or method `t' for main:Object (NameError)
# # puts divide_no(10, t)

# Error: There was an issue with the parameters you passed.
# Production - error handling is a must!!!!! Since you would want to show your users a "Nice Error"

#Its reccommended but don't focus on it too much JUST GET IT RUNNING!!!

#-----------------------------------------------------------------------------

#Custom Errors:

# class NegativeNumberError < StandardError 
# end
# #create our own error class that 

# def square_root(number)
#   raise NegativeNumberError, "Cannnot take square root of negative number." if number < 0
#     #RAISING AN ERROR 
#   return Math.sqrt(number)
# end

# begin 
#   puts square_root(9) #// 3.0
#   puts square_root(-4) 
# rescue NegativeNumberError => e #error
#   puts "Error: Negative number error"
# end

#-------------------------------EXERCISE---------------------------------------
# Task: Create a custom exception for invalid input.
# Instructions:
# Define a custom exception class InvalidInputError.
# Write a method that raises this exception when the input is invalid.
# Use rescue to handle the custom exception.

# class InvalidInputError < StandardError
# end

# def input_phonenumber #does not need (value) bc you are telling the user to input HOWEVER if YOU are inputting then (value) needed
#   puts "What is your phone number? (no dashes)"
#   phone_no = gets.chomp
#   raise InvalidInputError, "Dashes are present within phone number." if phone_no.include?("-")
#   end
#   return phone_no #return the input!
# end

# begin
#   # puts input_phonenumber(6719881234) #doesn't work bc its like you're inputting your number again???
#   phonenum = input_phonenumber # Test dashes 671-988-1234 
#   puts "Thank you for submitting your #{phonenum} correctly!"
#   #For some reason during USER input ensure would not be needed since it already passed the parameters in place
# rescue InvalidInputError => e
#   puts "Error: Please input #{phonenum} without dashes."
# # ensure
# #   puts "Thank you for submitting your #{phonenum} correctly!"
# #   #why is this still printing w/ invlaid input
# end

# #CONDENSED METHOD would be better for user inputs since its more concise
# def input_phonenumber 
#   puts "What is your phone number? (no dashes)"
#   phone_no = gets.chomp
#   raise InvalidInputError, "Dashes are present within phone number." if phone_no.include?("-")
#   return phone_no #return the input!
# rescue InvalidInputError => e
#   puts "Error: Please input #{phone_no} without dashes."
#   retry #works really well to test out function instead of running "ruby blah.rb" in terminal
# end

# puts input_phonenumber

#-----------------------------------------------------------------------------------

# def ask_yes_or_no
# attempts = 0

#   begin 
#     attempts +=1 #attempt +1 = 1... + 1 = 2
#     puts "Please enter Y or N (Attempt #{attempts}): "
#     input = gets.chomp.strip.upcase

#     #check if input is one of Y or N using a standard array 
#     raise "Invalid input. You must type 'Y' or 'N'." unless ["Y","N"].include?(input)#backwards!!! unless INPUT includes Y or N
    
#     puts "You entered: #{input}"
#     return input
    
#   rescue => e
#     puts e.message
#     if attempts < 3
#       retry #if less than 3 attempts retry
#     else
#       puts "Failed after 3 attempts"
#       #think of this like password input
#       return nil
#     end
#   ensure
#     puts "ask_yes_or_no operation completed."
#   end
# end

# answer = ask_yes_or_no
# p "Final answer: #{answer}"
    

#------------------------- EXERCISE -----------------------------------------
# Task: Implement retry in user input validation.
# Instructions:
# Copy and paste the following code and test out the retry functionality for yourself
    #BONUS
  # 1. Add Another Validation Check
  # Idea: If you’re asking for a number, also check if it’s greater than zero. Or if you’re asking for “Y/N,” also allow “YES/NO.”
  # 2. Ask the User if They’d Like to Retry
  # Idea: Instead of automatically retrying, prompt the user after an invalid attempt
  # 3. Track and Print All Invalid Inputs
  # Idea: Keep an array (e.g., invalid_responses) of everything the user entered incorrectly. Print it after you’re done.

def ask_yes_or_no
  attempts = 0
  invalid_inputs = []

  begin
    attempts += 1
    print "Please enter Y or N (Attempt ##{attempts}): "
    input = gets.chomp.strip.upcase

    # Check if input is one of "Y" or "N" using a standard array
   

    if !["Y", "N"].include?(input) #! == IF input is NOT included in YN ARRAY
      # invalid_inputs.push(input) #then push into invlaid array
      invalid_inputs << input #push input into invalid array
      raise "Invalid input. You must type 'Y' or 'N'." #AND raise 
    end 

    # if !["Y", "N"].include?(input)
    #   raise "Invalid input. You must type 'Y' or 'N'."
    # end    

    puts "You entered: #{input}"
    return input

  rescue => e
    puts e.message 

    if attempts < 3
      retry
    else
      puts "Failed after 3 attempts."
      puts "Invalid inputs: #{invalid_inputs.join(', ')}" unless invalid_inputs.empty?
        #Shows invalid inputs "nicely" UNLESS the array is empty!
      return invalid_inputs #have to put this to push into array!!!!
    end

  ensure
    puts "ask_yes_or_no operation completed."
  end
end

answer = ask_yes_or_no
p "Final answer: #{answer}"


# def password_validation
#   correc
#   attempts = 0
  
#     begin 
#       attempts +=1 #attempt +1 = 1... + 1 = 2
#       puts "Please enter your password (#{3 - attempts} left)"
#       input = gets.chomp
  
#       raise "Invalid input. You must type 'Y' or 'N'." unless ["Y","N"].include?(input)#backwards!!! unless INPUT includes Y or N
      
#       puts "You entered: #{input}"
#       return input
      
#     rescue => e
#       puts e.message
#       if attempts < 3
#         retry #if less than 3 attempts retry
#       else
#         puts "Failed after 3 attempts"
#         #think of this like password input
#         return nil
#       end
#     ensure
#       puts "ask_yes_or_no operation completed."
#     end
#   end
  
#   answer = ask_yes_or_no
#   p "Final answer: #{answer}"
#  
#

