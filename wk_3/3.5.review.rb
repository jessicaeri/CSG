# --------------------- WEEK 3.5 - DAY  15 --------------------------

# Question of the Day: what is your biggest takeaway from this?
# I really didn't know what to expect from this, but when I finally dove in its actually so easy and so fun. So don't be afraid to try new things. 

#Hotkey of the day: Mac: Shift + Cmd/Ctrl + F - global search in whatever folder/project you have open in VSCode

#-----------------------------------------------------------------
#Whats a class?
    #basically a blueprint for creating an object you'd be working with. 

# class Person 
#   def initialize(name, age)
#     @name = name 
#     @age = age 
#   end

#   def intro
#     "Hi my name is #{@name} and I'm #{@age} years old"
#         # #{name} and #{age} would not work unless attr_accessor :name, :age present
#   end
# end

# #How to create an object
# person = Person.new("Jess", 26)
# puts person.intro

#------------------------ EXERCISE ----------------------------------
#Task: Create a Book class with instance variables and methods.
# Instructions:
# Define a Book class with an initialize method.
# Set up instance variables @title, @author, and @pages.
# Define a method book_info that returns a string with the book's details.
# Instantiate a Book object and call book_info.

# class Book
#   def initialize(title, author, pages)
#     @title = title 
#     @author = author 
#     @pages = pages
#   end

#   def book_info 
#     "#{@title} by #{@author}. #{@pages} total pages."
#   end
# end

# library = []
# book1 = Book.new("Harry Potter and the Chamber of Secrets", "J.K. Rowling", 251)
# puts book1.book_info
#     #Harry Potter and the Chamber of Secrets by J.K. Rowling. 251 total pages.

# library << book1.book_info
# puts library
#-----------------------------------------------------------------------------

#Why do we do RSpec?
  #As we are building the application, we should not test something individually, that's why you'd test rspec on a specific file. 
  #We are doing it in an automated way!

# class Rectangle 
#   attr_accessor :length, :width

#   def initialize(length, width)
#     @length = length 
#     @width = width 
#   end

#   def area 
#     length * width 
#   end

#   def perimeter
#     2*(length + width)
#   end
# end

# shape = Rectangle.new(5,3)
# puts shape.length
# puts shape.width
# puts shape.area
# puts shape.perimeter
# # 5
# # 3
# # 15
# # 16

#look at reviee_spec.rb to see your test.

#----------------- EXERCISE ------------------------------
# Task: Add one more method to your book class and write RSpec tests for it
# Instructions:
# Add one more method of your choice to your book class.
# Test it to make sure it works
# Write RSpec tests for all methods you have in your book class (should be at least 3 in total)

class Book
  attr_accessor :title, :author, :pages, :number
  def initialize(title, author, pages, number)
    @title = title 
    @author = author 
    @pages = pages
    @number = number
  end

  def book_info 
    "#{@title} by #{@author}. #{@pages} total pages."
  end

  def pages_read #(number) 
    "Congratulations on reading #{@number} of pages out of #{@pages} total"
  end

  def assigned_reading 
    "You met the number of pages you need to read 50!"
  end
end

# library = []
# book1 = Book.new("Harry Potter and the Chamber of Secrets", "J.K. Rowling", 251,72)
# # puts book1.book_info
# #     #Harry Potter and the Chamber of Secrets by J.K. Rowling. 251 total pages.

# library << book1
# # puts library
# # puts book1.pages_read(72)
# # puts book1.pages_read

# library.each_with_index do |book, index|
#   puts "#{index +1}. #{book.title}"
#   puts "  Author: #{book.author}"
#   puts "  Total pages: #{book.pages}"
#   puts "  Pages completed: #{book.number}"
# end