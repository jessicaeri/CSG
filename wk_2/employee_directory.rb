#----------------------- Day 7: Group Activity ---------------------------------------

# Activity:
# Task: Create a program that manages a list of employees, where each employee has:
# A name (string)
# A position (string)
# A list of skills (array)
# Contact information (hash with :email and :phone)

# Instructions:
# Create a file named employee_directory.rb.
# Define an array of employee hashes.
# Iterate over the array to display each employee's information.

# employee_directory.each do |employee| 
puts "Name: #{employee[:name]}"
puts "  Position: #{employee[:position]}"
puts "  Skills:"
  employee[:skills].each do |key| #|(skills & contact), (management, carol@mail.com)
    puts "    - #{key}"
  end
puts "  Contact:"
  employee[:contact].each do |key, value| #|(skills & contact), (management, carol@mail.com)
    puts "    #{key}: #{value}"
  end
  # puts " \n "
end

# employee_directory.each do |employee| 
#   puts "Name: #{employee[:name]}"
#   puts "  Position: #{employee[:position]}"
#   puts "  Skills:"
#     employee[:skills].each do |key| #|(skills & contact), (management, carol@mail.com)
#       puts "    - #{key}"
#     end
#   puts "  Contact:"
#     employee[:contact].each do |key, value| #|(skills & contact), (management, carol@mail.com)
#       puts "    #{key}: #{value}"
#     end
#     # puts " \n "
# end

#Name: alice
# Position: clerk
# Skills:
#   - customer service
#   - money handling
# Contact:
#   email: alice@mail.com
#   phone: 123-456-789
# Name: bob
# Position: stocker
# Skills:
#   - organizing
#   - time-management
# Contact:
#   email: bob@mail.com
#   phone: 987-654-321
# Name: carol
# Position: store manager
# Skills:
#   - management
#   - detail oriented
# Contact:
#   email: carol@mail.com
#   phone: 456-789-123

#----------------------------------------------------