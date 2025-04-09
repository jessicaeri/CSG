#---------------------------- VARIABLES -----------------------------
#1. Write a program that uses a variable to store a number, then prints that number plus 15.
# a = 20 
# puts a+15

#2. Write a program that uses a variable to store a word, then prints that word with all capital letters.
# pet1 = "Billy"
# puts pet1.upcase

#3. Write a program that uses variables to store two numbers, then prints the numbers multiplied together.
# length = 5
# width = 10
# puts length *width

#4. Write a program that uses a variable to store a word, then prints that word in reverse order.
# pet2= "moebeanz"
# puts pet2.reverse


#5. Write a program that uses a variable to store a number, then prints the number divided by 5.
# cokecase = 25
# puts cokecase/5

#6. Write a program that uses variables to store two words, then prints both words on the same line in all capital letters.

#7.Write a program that uses a variable to store a word, then prints the number of letters in the word.
# a = "boboi"
# puts a.length


#8.Write a program that uses a variable to store a number with decimals, then prints the number as an integer.
# a = 1.8
# puts a.to_i

#9. Write a program that uses a variable to store a number, then prints the number squared.
# a = 4
# puts a**2

#10. Write a program that uses a variable to store a word, then prints the word with all lowercase letters.
# a = "KAIJU"
# puts a.downcase

#-------------------------- conditionals --------------------------
#1. Use a variable to store a number, then write a condition that prints "Perfect" if the number is equal to 25, and prints "Not quite" otherwise.
# a = 25
# a=1

# if a == 25
#   puts "Perfect"
# else 
#   puts "Not quite"
# end


#2. Use a variable to store a number, then write a condition that prints "Too cold" if the number is less than 75, prints "Too hot" if the number is greater than 85, and prints "Just right" if the number is between 75 and 85 (inclusive).

# temp = 98

# if temp < 75 
#   puts "Too cold"
# elsif temp > 85
#   puts "Too hot"
# else 
#   puts "Just right"
# end


#3. Use variables to store two numbers, then write a condition that prints "Both numbers are even" if both numbers are even, and prints "At least one number is odd" otherwise.
# a = 15 
# b = 13

# if a % 2 ==0 && b % 2 == 0
#   puts "Both numbers are even"
# else 
#   puts "At least one number is odd"
# end


# 4. Use a variable to store a number, then write a condition that prints "Typhoon warning" if the number is over 150, and prints "All clear" otherwise.

# wind_speed = 109

# if wind_speed > 150 
#   puts "Typhoon Warning!!!"
# else 
#   puts "All clear"
# end 


# 5. Use a variable to store a number, then write a condition that prints "Beginner" if the number is less than 3, prints "Intermediate" if the number is less than 7, prints "Advanced" if the number is less than 10, and prints "Expert" otherwise (only one print statement should occur).
# level = 3

# if level < 3
#   puts "Beginner"
# elsif level <7
#   puts "Intermediate"
# elsif level <10 
#   puts "Advanced"
# else
#   puts "Expert"
# end


# 6. Use variables to store two strings, then write a condition that prints "Access granted" if either string equals "admin", and prints "Access denied" otherwise.
# a = "admin"
# b = "user"

# if a.include?("admin") || b.include?("admin")
#   puts "Access granted"
# else 
#   puts "Access denied"
# end 



# 7. Use a variable to store a number, then write a condition that prints "Independence Day" if the number is less than 0, and prints "Liberation Day" otherwise.
# a = 1

# if a < 0 
#   puts "Independence Day"
# else 
#   puts "Liberation Day"
# end

# 8. Use a variable to store a string, then write a condition that prints "Valid email" if the string contains the @ symbol, and prints "Invalid email" otherwise.

# email = "test$mail.com"

# if email.include?("@")
#   puts "Valid email"
# else 
#   puts "Invalid email"
# end

# 9. Use variables to store a password and password confirmation, then write a condition that prints "Password doesn't match" if the two are different, and prints "Password confirmed" if they are the same.
# pw = "yonarulz"
# pw_conf = "yonarulz1"

# if pw == pw_conf 
#   puts "Password confirmed"
# else 
#   puts "Password doesn't match"
# end 

# 10.Use a variable to store a number, then write a condition that prints "Passing grade" if the number is greater than or equal to 70, and prints "Failing grade" otherwise.
# grade = 68

# if grade >= 70 
#   puts "Passing grade"
# else 
#   puts "Failing grade"
# end

#------------------------- LEON BREAK ROOM -------------------------------
 
# practice1. 
# loop do 
#   puts "Please enter number"

#   number = gets.chomp.to_i 

#   if number < 0 
#     return 
#   else
#   end 
# end 

# Write a while loop that asks the user to enter a number and will run forever until the user enters a number less than 0.

# while loop 
# puts something
# num = gets.chomp.to_i
# if num is more than 0 it will not end - it will keep going
# else - that's where it'll end

# loop do
#   puts "Please enter number:"
#   number = gets.chomp.to_i
#   if number < 0
#     return
#   else
#   end
# end

#practice 2
# each do ()
#   if % 2 == 0 those numbers pushed into a new array even 
#   else 
#   end 
# end 

# all.each do|x| 
#   if x % 2 == 0 
    
# Start with an array of visitor counts and create a new array with only the even numbers.
# For example, [122, 45, 60, 99, 200, 351, 84] becomes [122, 60, 200, 84].

# each do 
# if the thing using the % == 0 then those numbers would be pushed into a new array which will be even 
# else end

# all = [122, 45, 60, 99, 200, 351, 84]
# even = []

# all.each do |x|
#   if x % 2 == 0 
#     even.push(x)
#   end
# end
# puts even

#----------------------- LOOP DO --------------------

#1. Write a while loop to print the numbers 1 through 12.
# x =1 
# while x <=12
#   puts x 
#   x = x+1
# end

#2. Write a while loop that prints the phrase "Hafa Adai" 5 times.

# greet = "Hafa Adai!"

# 5.times do 
#   puts greet
# end 

# 3. Write a while loop that asks the user to enter a village name and will run forever until the user enters the word "Hagåtña".

# while true 
#   puts "Input a village name:"
#   village = gets.chomp.downcase
#   if village.include?("hagatna")
#     return 
#   end 
# end

# 4. Write a while loop that prints the temperatures from 75 to 95 degrees, increasing by 2 each time.

# temp = 75
# while temp <= 95
#   puts temp
#   temp = temp +2
# end

#5. Write a while loop that prints the year "2023" eight times.

# 8.times do 
#   puts "2023"
# end 

# 6. Write a while loop that asks the user to enter a rainfall amount in inches and will run forever until the user enters a number greater than 3.

# while true
#   puts "Enter the amount of rainfall in inches:"
#   rainfall = gets.chomp.to_i 

#   if rainfall >= 3
#     return 
#   end 
# end 


# 7. Write a while loop that prints the numbers 50 to 70.
# x = 50 

# while x <= 70 
#   puts x 
#   x = x+1
# end



# 8. Write a while loop that prints the phrase "Pacific Paradise" 12 times.
# count = 0 

# while count <=12
#   puts "Pacific Paradise"
#   count = count +1
# end 


# 9. Write a while loop that asks the user to enter a number and will run forever until the user enters a number less than 0.
# loop do
#   puts "Please enter a number:"
#   number = gets.chomp.to_i

#   if number < 0 
#     return 
#   end
# end 


# 10. Write a while loop that prints the numbers 100, 90, 80, 70, 60, ..., 10, 0.
# x = 100
# while x >= 0 
#   puts x 
#   x = x - 10 
# end 

#---------------------------- Arrays & Hashes ---------------------------
# 1. Create an array to store 3 Guam beaches. Then add two more beaches to the array and print the array on one line.
# Guam_beaches = []
# count =1 
# while count <=3
#   puts "Please name a beach on Guam."
#   beach = gets.chomp.downcase
#   Guam_beaches.push(beach)
#   count = count +1
# end 

# puts Guam_beaches.join(", ")

#2. Create an array to store 4 island fruits. Then change the second fruit to a vegetable and print the array on one line.
# island_fruits = ["bilembines", "niyok", "aga", "mango"]
# pp island_fruits
# island_fruits[1] = "sigidiyas"
# puts island_fruits.join(", ")

# 3. Create an array to store 5 daily temperatures in Fahrenheit. Then print out each temperature on separate lines with a while loop.



# 4. Create an array to store 1 village name. Then add three more village names to the array and print the array on one line.


# 5. Create an array to store 3 Chamorro words with lower case letters. Then change the third word to have all capital letters and print the array on one line.
# 6. Create an array to store 3 local restaurant names. Then print out each name on separate lines with a while loop.
# 7. Create an array to store 2 tourist activities. Then add one activity to the array and print the array on one line.


# 8. Create an array to store 5 numbers. Then print out each number multiplied by 3 on separate lines with a while loop.
# 9. Create a hash to store a person's first name, last name, and hometown. Then print the hash on one line.
# 10. Create a hash to store the beach name, water temperature, and visibility. Then print each hash key and value on separate lines.



  