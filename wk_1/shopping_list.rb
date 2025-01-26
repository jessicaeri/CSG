#----------------- EXERCISE: COLLAB w/ Aureana ----------------------------

shopping_list = []

loop do 
puts "Shopping List \n Choose a number: \n 1 - Add Item \n 2 - Remove Item \n 3 - View List \n 4 - Exit"
puts "\n"
choice = gets.chomp.to_i

  if choice == 1
    puts "\n What item would you like to add to your shopping list?"
    item = gets.chomp
    shopping_list.push(item)
    puts "\n"
    puts shopping_list
  elsif choice == 2
    puts " \n What item would you like to remove from your shopping list?"
    item = gets.chomp
    shopping_list.delete("#{item}")
    puts "\n"
    puts shopping_list
  elsif choice == 3
    puts "\n"
    puts "---------------------------------------"
    puts "\n"
    puts "\n"
    p shopping_list
    puts "\n"
    puts "\n"
    puts "---------------------------------------"
  elsif choice == 4
     puts "\n"
    puts "---------------------------------------"
    puts "\n"
    puts "\n"
    puts "\n"
   puts "Happy Shopping!"
   puts "\n"
   puts "\n"
   puts "\n"
   puts "---------------------------------------"
   break
  end
end