# Exercise:
# Create a file called menu_loop.rb where you display a simple text-based menu repeatedly until the user chooses to exit.
# Requirements:
# Print a menu:
# 1) Greet
# 2) Tell a joke
# 3) Exit
# If the user chooses 1, ask for their name and greet them.
# If the user chooses 2, print any short joke.
# If the user chooses 3, exit the loop.
# If the user enters an invalid choice, prompt them again.

# loop do
#   puts "Please select from the following menu items. (1 - Greet, 2 - Joke, 3 - Exit)"
#   choice = gets.chomp.to_i

#   if choice == 1
#     puts "Buenas yan Hafa Adai, what is your name?"
#     name = gets.chomp
#     puts "Buenas, #{name}! \n " #\n prints line between next request
#   elsif choice == 2 
#     puts "What's a crab on Guam's favorite song? -- Ayuyu on da beat "
#   elsif choice == 3
#     break
#   else
#     puts "Error: Invalid choice"
#   end
#   puts "Would you like to choose a different menu item? (y/n)"
#   continue = gets.chomp.downcase
#   break unless continue == "y"
# end


#------------ EXERCISE 2 ---------------------

# Let’s extend the idea of the menu_loop.rb. Now, add another menu item for 4) Countdown Timer.
# If the user picks 4, ask them for a number n.
# Print a countdown from n to 0 using any loop.
# Print "Blast off!" at the end.

# def blastoff #great way to practice/make code in separate file and paste into working file.
#   puts "Choose a number."
#   n = gets.chomp.to_i
#   until n == 0
#     puts "Coundown: #{n}! \n "
#     n-= 1
#   end
#     puts "BOOM!!!"
# end

# loop do
#   puts "Please select from the following menu items. (1 - Greet, 2 - Joke, 3 - Exit, 4 - BLAST OFF)"
#   choice = gets.chomp.to_i

#   if choice == 1
#     puts "Buenas yan Hafa Adai, what is your name?"
#     name = gets.chomp
#     puts "Buenas, #{name}! \n " #\n prints line between next request
#   elsif choice == 2 
#     puts "What's a crab on Guam's favorite song? -- Ayuyu on da beat "
#   elsif choice == 3
#     puts "Would you like to choose a different menu item? (y/n)"
#   continue = gets.chomp.downcase
#   break unless continue == "y"
#   elsif choice == 4
#     blastoff
#   else
#     puts "Error: Invalid choice. \n"
#   puts "Would you like to choose a different menu item? (y/n)"
#   continue = gets.chomp.downcase
#   break unless continue == "y"
#   end
# end