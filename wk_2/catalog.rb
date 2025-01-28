#------------------ Day 7: Activity ------------------------

# Activity:
# Task: Build a program that allows users to:
# Add new items to a catalog.
# Each item should have a name, category, price, and tags.
# Display all items in the catalog.
# Instructions:
# Create a file named catalog.rb.
# Use arrays and hashes to store item data.
# Implement a simple menu to interact with the catalog.

# EXAMPLE


# 2. Method to display the menu
def display_menu
  puts "\nCatalog Menu:"
  puts "1. Add an item"
  puts "2. View all items"
  puts "3. Exit"
  print "Enter your choice: "
end


def add_tags(x)
  added_tags = []
  
  2.times do 
    puts "Input tags."
    tag_input = gets.chomp
    # catalog[:tags].push(tag_input) #pushes each tag (test1, test 2)
    added_tags.push(tag_input)
  end

  added_tags.each do |tag|
    x[:tags].push(tag)
  end

end

catalog = []

loop do
  puts display_menu
  choice = gets.chomp.to_i

  if choice == 1
    puts "Please enter catalog item."
    name = gets.chomp.capitalize
    puts "Please enter #{name}'s price."
    price = gets.chomp.to_f
    puts "Please enter #{name}'s category."
    category = gets.chomp.downcase
    
      item = { item: name, 
        price: price, 
        category: category, 
        tags:[]
      }
      

    add_tags(item)

    catalog.push(item)
    
  elsif choice == 2 #view
    catalog.each do |item_descr| 
      puts "Item: #{item_descr[:item]}"
      puts "  Price: #{item_descr[:price]}"
      puts "  Category: #{item_descr[:category]}"
      puts "  Tags: #{item_descr[:tags].join(', ')}" #tags are joined together!!!!!!
    end

  elsif choice == 3 #Exit
    # ---- EXIT ----
    puts "Goodbye!"
    break
  else
    # ---- INVALID CHOICE ----
    puts "Invalid choice. Please try again."
  end

end

