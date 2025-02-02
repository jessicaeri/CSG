# puts "How many times fo you want 'Ruby is fun!' typed out?"
#   answer = gets.chomp.to_i #convert answer into integer

# answer.times do
#   puts "Ruby is fun!"
# end

# loop do
#   puts "How many times fo you want 'Ruby is fun!' typed out?"
#   answer = gets.chomp.to_i
#   answer.times do #bc its more concise that for
#     puts "Ruby is fun!"
#   end

#   puts "Do you want to try another number? (y/n)"
#   continue = gets.chomp.downcase #.downcase forces input to match next line
#   break unless continue == "y" #if 'Y' then would be an error and would end loop

# end

# loop do
#   puts "How many times fo you want 'Ruby is fun!' typed out?"
#   answer = gets.chomp
#     if answer =~ /\A\d+\z/ && answer.to_i > 0 #=~ is a tool that helps you search for patterns in text #integer is not a negative number
#       valid_answer = answer.to_i #converts answer to integer FOSHO
      
#       valid_answer.times do #bc its more concise that for
#         puts "Ruby is fun!"
#       end
#     else
#       puts "Please input valid integer."
#       next #back to start of the loop
#     end


#   puts "Do you want to try another number? (y/n)"
#   continue = gets.chomp.downcase #.downcase forces input to match next line
#   break unless continue == "y" #if 'Y' then would be an error and would end loop

# end

# start_time = Time.now 

# (1..1_000_000).each do |i| 
#   # do nothing or just increment a counter 
# end 

# end_time = Time.now 
# puts "Loop took #{end_time - start_time} seconds."

# start_time = Time.now 

# (1..4_000_000).each do |i| 
#   # do nothing or just increment a counter 
# end 

# end_time = Time.now 
# puts "Loop took #{end_time - start_time} seconds."

# #FOR COMPARISON 

# start_time = Time.now 
# loop do
#   puts "How many times fo you want 'Ruby is fun!' typed out?"
#   answer = gets.chomp
#     if answer =~ /\A\d+\z/ && answer.to_i > 0 #=~ is a tool that helps you search for patterns in text #integer is not a negative number
#       valid_answer = answer.to_i #converts answer to integer FOSHO
      
#       valid_answer.times do #bc its more concise that for
#         puts "Ruby is fun!"
#       end
#       break
#     else
#       puts "Please input valid integer."
#       next #back to start of the loop
#     end

#   end
# end_time = Time.now 
# puts "Loop took #{end_time - start_time} seconds."


# #WHILE COMPARISON

# start_time = Time.now 

# running = true #have to be true to run loop

# while running
#   puts "How many times do you want 'Ruby is fun!' typed out?"
#   answer = gets.chomp

#   if answer =~ /\A\d+\z/ && answer.to_i > 0
#     valid_answer = answer.to_i
    
#     valid_answer.times do
#       puts "Ruby is fun!"
#     end
#     break

#   else
#     puts "Please input a valid positive integer."
#     next # Goes back to the start of the loop
#   end
# end

# end_time = Time.now 
# puts "Loop took #{end_time - start_time} seconds."

#While takes longer, but could be based off user error since dependent on user input timing. 

# puts "Enter a number 'n' to creat a multiplication table:"
# n = gets.chomp.to_i


# for i in 1..n 
#   for j in 1..n
#     print "#{i*j}" #with some spacing 
#   end 
#   puts #new line after each row will appear
# end

#String Slicing


# puts "Please type something"
# input_string = gets.chomp.strip #"hello"
# index = input_string.length - 1 #starts with last character "o"

# reversed_str = "" #manually inputed
# while index >= 0 #while input is more than 0
#   reversed_str << input_string[index] #reverse string is less than the input string's length
#   index -= 1 #subtracts one chracter each iteration
# end

# puts "Manual reverse string input: #{reversed_str}"
# puts "Built-in reverse string input: #{input_string.reverse}"
# # Please type something
# # hello
# # Manual reverse string input: olleh
# # Built-in reverse string input: olleh