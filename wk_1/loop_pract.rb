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

loop do
  puts "How many times fo you want 'Ruby is fun!' typed out?"
  answer = gets.chomp.to_i
  answer.times do #bc its more concise that for
    puts "Ruby is fun!"
  end

  puts "Do you want to try another number? (y/n)"
  continue = gets.chomp.downcase #.downcase forces input to match next line
  break unless continue == "y" #if 'Y' then would be an error and would end loop

end