# --------------------- WEEK 3.1 - DAY  11 -------------------------------

# Question of the Day: What is your strategy in dealing with stress?
# Lists are also really good thing 

#Hotkey of the day: Cmd + right or left - moves your cursor all the way to the end of the line

#-----------------------------------------------------------------
# OBJECT ORIENTED PROGRAMMING 
#     uses objects/methods to model real world entities within your code.

#----------- ENCAPSULATION ------------
    #bundles data and methods that operate on that data within one class 
    #


#------------ ABSTRACTION -------------
  #analogy its like a steering wheel its controlling the car but we don't knwo what's going on under the hood. 
  #In the same way, we are only showing what's needed and not what's going on behind the scenes

# name = "Leon"
# puts name.class #class is blueprint that categorizes the input 
# #// string 
# number = 10 
# puts number.class

# class Cat
#   #methods and logic
# end

# my_cat = Cat.new
# puts my_cat.class

#---------------------- EXERCISE: Creating a Class ---------
# Task: Create a new Ruby file called person.rb and define an empty Person class.
# Instructions:
# Open VSCode and create a new file named oop.rb.
# Define an empty Person class.
# Create an instance of Person and assign it to a variable.
# Print the class of the instance using puts.

# class Person
#   #methods, logic, etc.etc.
# end

# person_1_jess = Person.new
# puts person_1_jess.class

#--------------------------------------------------------
#Instance variable - holding data for this particular variable  
  # "@"


# class Person
#   def set_name(name) #takes parameter to set @name to mean name
#     @name = name 
#   end

#   def get_name #allows us to retrieve name within the function
#     @name
#   end
# end


# person_1 = Person.new
# person_1.set_name("Jess")
# puts person_1.get_name
#     #Jess

#---------------- EXERCISE -----------------------------
# Activity:
# Task: Extend the Person class to include an age attribute.
# Instructions:
# Add methods set_age and get_age.
# Use @age as the instance variable for age.
# Create an instance of Person, set the name and age, and print them.

# class Person
#   def set_name(name) #takes parameter to set @name to mean name
#     @name = name 
#   end

#   def get_name #allows us to retrieve name within the function
#     @name
#   end

#   def set_age(age)
#     @age = age
#   end

#   def get_age
#     @age
#   end
# end

# person_1.set_name("Jess")
# puts person_1.get_name
#     #Jess
# person_1.set_age(26)
# puts person_1.get_age
#     #26

#---------------------------------------------------------------------
#Condensed method - Initialize

# class Person
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end

#   def get_name #allows us to retrieve name within the function
#     @name
#   end

#   def get_age
#     @age
#   end
# end

# person1 = Person.new("Jessica", 26)
# puts person1.get_name
# puts person1.get_age
#     #Jessica
#     #26

#-------------------------------GETTER & SETTER Methods -------------------------------------
#Previous method above = Getter 


#---------SETTER---------------

#attr_reader :name = creates a getter method for vairable
#attr_writer :name = creates a setter method for variable
#attr_accessor :name creates both getter and setter methods 

class Person 
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name 
    @age = age
  end
end

person1 = Person.new("JessicaEri", 26)
puts person1.name 
puts person1.age
    # JessicaEri
    # 26