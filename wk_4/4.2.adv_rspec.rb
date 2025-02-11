# --------------------- WEEK 4.2 - DAY  17 -------------------------------

# Question of the Day: If you have a deadline, are you a get it done right away or wait til the last minute?
    # Both. but if I have alot of stuff. I would do all the easy ones first and usually the last ones are harder and would do it til the last minute...

#Hotkey of the day: 

#-----------------------------------------------------------------

#-------------- MOCKING -----------------

# Mocking:
  # Simulating the behavior of real objects in controlled ways.
  # Useful for isolating the code under test.
  
  #Mo

# Stubbing:
  # Providing predefined responses to method calls during a test.
  # Helps test methods that depend on external services or complex logic.
  
  #Idea: Relying on online service (e.g. weather API) those applications are relying on weather API
        #want to test the methods but not necessarily the API that is being used.
        #Can use without API functioning

class Student 
  attr_accessor :name, :grades

  def initialize(name)
    @name = name 
    @grades = []    
  end

  def average_grade
    return 0 if grades.empty?
    total = grades.reduce(:+) #sums up items in array
    return total/grades.size #length of array (kinda like .count)
  end

end

# student1 = Student.new("Damen")
# puts student1.name
# puts student1.grades #shoudl see nothing since there are no initialized data

# student1.grades = [100,90,80]

# puts student1.grades

# # terminal - irb = interaactive ruby
#         #irb(main):001> grades = [100,90,80]
#         # => [100, 90, 80]
#         # irb(main):002> grades.reduce(:+)
#         # => 270
#         # irb(main):003> grades.size
#         # => 3
#         # irb(main):004> grades.count
#         # => 3
#         # irb(main):005> exit

# p student1.average_grade #\\ 90

#-------------------------- eXERCISE -----------------

# Task: Write tests for a Library class using mocks and stubs.
# Instructions:
# Create a Library class with a method fetch_books_from_api that simulates fetching book data from an external API.
# Use stubbing to simulate the API response in your tests.

# class Library 
#     attr_accessor :member, :library

#     def inialize(member)
#     @member = member 
#     @library = [] #api
#     end

#     def fetch_books_from_api(book)
#         if @library.include?(book)
#             @library.delete(book)
#             puts "Enjoy your book #{@member}!"
#         else 
#             puts "Book not found within library."
#         end
#     end
# end

class Library
    def fetch_books_from_api #mocking an API database 
            # Simulate a call to an external API
      sleep(5) 
            # Simulates network delay - pauses it 2 seconds 
      ["Book 1", "Book 2", "Book 3"]
    end
  
    def books
      @books ||= fetch_books_from_api 
    end
  end

  library = Library.new
  puts library.fetch_books_from_api
