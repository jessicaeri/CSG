# --------------------- WEEK 3.4 - DAY  14 --------------------------

# Question of the Day: Would you like to explore the ocean? or outer space?
    #OCEAN DUHHHHHHHHh

#Hotkey of the day: Mac: Cmd + P / Windows: Ctrl + P – Quickly open a file in VSCode

#-----------------------------------------------------------------

#MODULES AND MIX-INS

#name spacing
#   prevent name collisions by organizing code into separate spaces 


#mixins
# add shared functionality to classes without using inheritance

# module MathConstants
#   PI = 3.14159
#   E = 2.71828
# end

# puts MathConstants::PI #printing PI

# module PDFTools 
#     class Printer
#         def print_file(file)
#         puts "Printing #{file} as a PDF."
#         end
#     end
# end
  
# module NetworkTools
#     class Printer #reuse class printer
#         def print_file(file)
#         puts "Printing #{file} over the network."
#         end
#     end
# end

#way for you to separate functions into different "folders" while using the same name. 
#kinda to keep it more organized
    #think Desktop/CSG and Downloads/CSG

#   pdf_printer = PDFTools::Printer.new
#   network_printer = NetworkTools::Printer.new
  
#   pdf_printer.print_file("document.txt")
#   network_printer.print_file("document.txt")

#--------------------------- EXERCISE ---------------------------------

#Task: Create modules to namespace classes.
# Instructions:
# Create a new Ruby file named modules.rb.
# Define two modules: Animals::Mammals and Animals::Birds.
# In each module, create a class named Animal with a method speak.
# Instantiate objects from each class and call speak.

# module Animals
#   class Mammals
#     attr_accessor :sound

#     def initialize(sound)
#       @sound = sound 
#     end

#     def speak 
#         "#{sound}"  
#     end 
    
#   end
# end

# module Animals
#   class Birds
#     attr_accessor :sound

#     def initialize(sound)
#       @sound = sound 
#     end

#     def speak 
#         "#{sound}"  
#     end 
    
#   end
# end

# mammal = Animals::Mammals.new("Rawr")
# bird = Animals::Birds.new("Squawk")

# puts mammal.speak
# puts bird.speak

#checkign if it works in a wrapped module
# module Animals
#     class Mammals
#       attr_accessor :sound
  
#       def initialize(sound)
#         @sound = sound 
#       end
  
#       def speak 
#           "#{sound}"  
#       end 
#     end

#     class Birds
#         attr_accessor :sound
    
#         def initialize(sound)
#           @sound = sound 
#         end
    
#         def speak 
#             "#{sound}"  
#         end 
        
#     end
# end
# mammal = Animals::Mammals.new("Rawr")
# bird = Animals::Birds.new("Squawk")

# puts mammal.speak
# puts bird.speak

#----------------------------------------------------------------------------
#class inherating from module

# module Greetable
#   def greet
#     "Hello"
#   end
# end

# class Something 
#   def something_cool
#     "something cool"
#   end
# end

# class Person 
#   include Greetable #INHERITANCE but can only inherit ONCE
# end

# person = Person.new
# puts person.greet #bc we included the greet definition from the module
#         #Hello

#-----------------------------------------------------------------------------
# module Loggable 
#   def log(message)
#     puts "Log: #{Time.now} - #{message}" #so that it prints it automatically
#   end
# end

# class Person 
#   include Loggable

#   def initialize(name)
#     @name = name 
#     log("New Person created with name - #{@name}")
#   end

#   def test2
#     "FROM THE SUPER CLASS"
#   end
# end

# class Student < Person #can an inherited class have the included module available??? Look at line 179
#     #HOWEVER CANNOT INHERIT TWICE MEAING Student < Person < Homework
#   def intialize(name)
#     super(name)
#     log("Testing in the Student class")
#   end

#   def test 
#     "Success"
#   end
# end

# class Homework < Student #BUT CAN CHAIN!!!
#   def intialize(subject)
#     @subject = subject
#     log("IN THE HOMEWORK CLASS")
#   end
# end

# person = Person.new("Jess")
#         #Log: 2025-02-06 18:30:11 +1000 - New Person created with name - Jess

# student = Student.new("Leon")
#         #Log: 2025-02-06 18:35:10 +1000 - New Person created with name - Leon

# homework = Homework.new("Math")
#         #Log: 2025-02-06 18:38:36 +1000 - New Person created with name - Math

# puts homework.test
#         #Success

# puts homework.test2
#         #FROM THE SUPER CLASS
#--------------------------------------------------------------------------------
# Task
# Create a mixin (module) that you can include in multiple classes to share a common method.

# Instructions
# Define a module called Driveable.
# Inside Driveable, define a method drive that returns or prints a message like "Driving the <class name>!".
# Create two classes, Car and Motorcycle, in the same file.
# In each class, include the Driveable module.
# Instantiate objects from both Car and Motorcycle and call the drive method on each.
# Print or return the result so you can see that both classes share the same functionality.

# module Driveable 
#   def drive(vehicle)
#     puts "Driving the #{vehicle}!"
#   end
# end

# class Car 
#   include Driveable

#   def initialize(name)
#     @name = name
#     drive("#{@name}") #drive(vehicle)
#   end

# end

# class Motorcycle 
#   include Driveable

#   def initialize(name)
#     @name = name
#     drive("#{@name}") #drive(vehicle)
#   end

# end

# car = Car.new("4Runner")
#         #Driving the 4Runner!

# motorcycle = Motorcycle.new("Ryvid Anthem")
#         #Driving the Ryvid Anthem!                          
#---------------------------------------------------------------------------------

#CLASS EXERCISE 

# module Walkable 
#   def walk(message)
#     puts "On a walk with #{message}"
#   end
# end

# class Person 
#   include Walkable 

#   def initialize(name)
#     @name = name 
#     walk("#{name}")
#   end
# end

# class Dog 
#     include Walkable 

#     def initialize(name)
#         @name = name 
#         walk("#{name}")
#     end
# end

# person = Person.new("Snoop Dogg")
#         #On a walk with Snoop Dogg
# dog = Dog.new("Snoop's Dog")
#         #On a walk with Snoop's Dog

#-----------------------------------------------------------------

# Task: Create a module with multiple methods and include it in a class.
# Instructions:
# Define a module MathOperations with methods add, subtract, multiply, divide.
# Create a class Calculator.
# Include MathOperations in Calculator.
# Instantiate Calculator and perform calculations.

# module MathOperations
#   def add(a, b)
#     puts "Sum = #{a + b}"
#   end

#   def subtract(a, b)
#     puts "Difference = #{a - b}"
#   end

#   def multiply(a, b)
#     puts "Product = #{a * b}"
#   end

#   def divide(a, b)
#     puts "Quotient = #{a / b}"
#     puts "   w/ a remainder of #{a % b}"
#   end
# end

# class Calculate
#   include MathOperations

#   def initialize(num1, num2)
#     @num1 = num1
#     @num2 = num2
    
#             #IF WITHIN INITIALIZE WE DO NOT NEED @num1, @num2 
#     # puts "Performing calculations for #{num1} and #{@num2}: \n "
#     # add(num1, @num2)
#     # subtract(num1, num2)
#     # multiply(@num1, num2)
#     # divide(@num2)
#   end

#   def perform_all
#             #BUT IN A SEPARATE DEFINITION WE NEED TO ADD @num or #{@num}
#     puts "Performing calculations for #{@num1} and #{@num2}: \n "
#     add(@num1, @num2)
#     subtract(@num1, @num2)
#     multiply(@num1, @num2)
#     divide(@num1, @num2)
#   end
    
# end

# calculate = Calculate.new(3,2)
# calculate.perform_all
        
# calculate.add(3,2) #for individual calculations
#         # Sum = 5

#------------------------------------------------------------------------------

#How do I call a module directly 

#Two ways immediately:
    #Within def add self.blah blah #line 351

# module MathOperations
#   def self.add(a, b)
#     puts "Sum = #{a + b}"
#   end
# end

# puts MathOperations.add(1,2) #Sum = 3

#         #Call modulename.add
# module MathOperations
#     def add(a, b)
#         puts "Sum = #{a + b}"
#     end
# end

# puts MathOperations.add(1,2)#Sum = 3

#-------------------------------------------------------------------------------

# MIXINS (modules) vs INHERITANCE

#use inheritance for an is-a relationship
    #heirarchy 
        #Animal -> Mammal -> Bat
        
#use mixins for shared behavior
    #Can fly 
        #Bat - Bird 

#----------------------------------------------------------------------------
module Introduction
    def introduce_name
      "Hello, my name is #{@name}"
    end

    def introduce_age
      "I am #{age} years old"
    end

end
  
class Person
    include Introduction
    attr_accessor :name, :age

    def initialize(name, age)
        raise ArgumentError, 'Age must be a positive number' if age < 0
        @name = name
        @age = age
    end
end
  
class Student < Person
    def initialize(name, age, grade, school)
        super(name, age)
        @grade = grade
        @school = school
    end
end
  
class Teacher < Person
    def initialize(name, age, subject, years_of_experience)
    super(name, age)
    @subject = subject
    @years_of_experience = years_of_experience
    end
end
  
  # student = Student.new("Leon", 25, "12", "FD")
  # puts student.introduce
  
  # teacher = Teacher.new("Charles", 26, "Computer Science", 50)
  # puts teacher.introduce
#------------------------------ EXERCISE-----------------------------
# Instructions:
# Create another method for the Introduction module
# Test that method in the Person, Student, or Teacher classes
# Write an RSpec test in introduction_spec.rb for it

