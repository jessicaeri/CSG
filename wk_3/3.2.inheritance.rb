# --------------------- WEEK 3.2 - DAY  12 -------------------------------

# Question of the Day: What app would you like to make that could fix anything?
# I want an app that basically gamifies finances that would tell me what card to use strategically for maximum points.

#Hotkey of the day: Today's hotkey is understanding that we can split our terminals into 2 (or more) that way it's more convenient for us to do multiple things in our terminal at once

#-----------------------------------------------------------------

#Inheritance - 

# General Class - Animal 
# Subclass - Species
    #inherit specific attributes from it 

# class Vehicle 
#   def initialize(make, model)
#     @make = make 
#     @model = model 
#   end

#   def info 
#     "Vehicle Make: #{@make}, Model: #{@model}"
#   end
# end

# vehicle = Vehicle.new("Toyoya", "Tundra")
# # puts vehicle.make 
# # puts vehicle.model

# class Motorcycle < Vehicle #motorcycle inherits from vehicle
#   def number_of_wheels
#     2
#   end
# end

# class Car < Vehicle #motorcycle inherits from vehicle
#   def number_of_wheels
#     4
#   end
# end

# car = Car.new("Toyota", "Tacoma")
# motorcycle = Motorcycle.new("Harley", "Sportster")

# puts car.info
# puts "Car Wheels: #{car.number_of_wheels}"
#     # Vehicle Make: Toyota, Model: Tacoma
#     # Car Wheels: 4

# puts motorcycle.info
# puts "Motorcyle Wheels: #{motorcycle.number_of_wheels}"
#     # Vehicle Make: Harley, Model: Sportster
#     # Motorcyle Wheels: 2

    #Basically inherits the same functions within the "Greater" class

#-------------------------- EXERCISE ------------------------------
# Task: Create a Person superclass and Student and Teacher subclasses.
# Instructions:
# Create a new Ruby file named inheritance.rb.
# Define a Person class with attributes name and age, and a method introduce.
# Create Student and Teacher classes that inherit from Person.
# Add a grade attribute to Student and a subject attribute to Teacher.
# Instantiate objects from both subclasses and call their methods.

# class Person 
#   # attr_accessor :name, :age, :introduce #setter adn getter
#   #       technically do not need this bc you applied "get" in introduce!

#   def initialize(name, age) # setter
#     @name = name
#     @age = age
#   end

#   def introduce #getter
#     puts "Hello my name is #{@name} and I am #{@age}!"
#   end
# end

# person_1 = Person.new("Simba", 8)
# puts person_1.introduce

# person_2 = Person.new("D. Lindstrom", 62)
# puts person_2.introduce

# class Student < Person 
#   attr_accessor :grade_level

#   def initialize (name, age, grade_level)
#     @name = name
#     @age = age
#     @grade_level = grade_level
#   end

#   def introduce_student #getter
#     puts "I am currently a #{@grade_level} grader."
#   end
# end

# class Teacher < Person 
#   def initialize (name, age, teach_subject)
#     @name = name
#     @age = age
#     @teach_subject = teach_subject
#   end

#   def introduce_teacher #getter
#     puts "I am currently teaching #{@teach_subject}."
#   end
# end

# student_1 = Person.new("Simba", 8) 
# puts student_1.introduce

# student_1 = Student.new("Simba", 8, "4th") 
# puts student_1.introduce
# puts student_1.introduce_student

# teacher_1 = Teacher.new("Kaiju", 28, "P.E.") 
# puts teacher_1.introduce
# puts teacher_1.introduce_teacher

#----------------------------- SUPERCLASS ----------------------------------
#DRY = DO NOT REPEAT YOURSELF 

#superclass - reuses logic and variables from the "SUPER" class and use in subclass

# class Person 
#   # attr_accessor :name, :age, :introduce #setter adn getter
#   #       technically do not need this bc you applied "get" in introduce!

#   def initialize(name, age) # setter
#     @name = name
#     @age = age
#   end

#   def introduce #getter
#     "Hello my name is #{@name} and I am #{@age}!" #we don't always want to print/puts it out but ALWAYS return
#   end
# end

# class Student < Person 
#   attr_accessor :grade_level

#   def initialize(name, age, grade_level)
#     super(name, age)
#     @grade_level = grade_level
#   end

#   def introduce #getter
#     "#{super} I am currently a #{@grade_level} grader."
#   end
# end

# class Teacher < Person 
#   def initialize (name, age, teach_subject)
#     super(name, age)
#     @teach_subject = teach_subject
#   end

#   def introduce #getter
#     super + "I am currently teaching #{@teach_subject}."
#   end
# end

# student_1 = Student.new("Simba", 8, "4th") 
# puts student_1.introduce

# teacher_1 = Teacher.new("Kaiju", 28, "P.E.") 
# puts teacher_1.introduce


#---------------------- Polymorphism ---------------------------
# Enables you to write over a method in the superclass that would be tailored to the subclass.


# class Teacher < Person 
#   def initialize (name, age, teach_subject)
#     super(name, age)
#     @teach_subject = teach_subject
#   end

#   def introduce #getter
#     # super + "I am currently teaching #{@teach_subject}."
#     "I am a teacher."
#   end
# end

# puts teacher_1.introduce 
  #I am a teacher

#------------------------- EXERCISE -----------------------------
# Task: Modify the introduce method in Student and Teacher to include more details, ensuring the use of super.
# Instructions:
# In your Student class, add an attribute school and include it in the introduce method using super.
# In your Teacher class, add an attribute years_of_experience and include it in the introduce method using super.
# Test your code by creating new instances and calling introduce.

# class Person 

#   def initialize(name, age) # setter
#     @name = name
#     @age = age
#   end

#   def introduce #getter
#     "Hello my name is #{@name} and I am #{@age}!" #we don't always want to print/puts it out but ALWAYS return
#   end
# end

# class Student < Person 
#   attr_accessor :grade_level, :school

#   def initialize(name, age, grade_level, school)
#     super(name, age)
#     @grade_level = grade_level
#     @school = school 
#   end

#   def introduce #getter
#     "#{super} I am currently a #{@grade_level} grader at #{@school}."
#   end
# end

# class Teacher < Person 
#   def initialize (name, age, teach_subject, years_of_experience)
#     super(name, age)
#     @teach_subject = teach_subject
#     @years_of_experience = years_of_experience
#   end

#   def introduce #getter
#     super + " I am currently teaching #{@teach_subject} and I have #{@years_of_experience} years of experience."
#   end
# end

# student_1 = Student.new("Simba", 8, "4th", "Tamuning Elementary") 
# puts student_1.introduce

# teacher_1 = Teacher.new("Kaiju", 28, "P.E.", 4) 
# puts teacher_1.introduce

#---------------------------- GROUP ACTIVITY--------------------------------------------

# Task: Plan a program that utilizes inheritance and polymorphism to model a real-world scenario.
# Instructions:
# Choose a scenario, such as a library system, zoo management, or school administration.
# Identify the classes needed, along with their attributes and methods.
# Determine the superclass and subclasses.
# Decide how polymorphism and method overriding will be used.
# Example Scenarios:
# Library System:
# Superclass: LibraryItem
# Subclasses: Book, Magazine, DVD
# Common Methods: checkout, return_item
# Polymorphism: Different checkout behaviors for each item type.
# Zoo Management:
# Superclass: Animal
# Subclasses: Mammal, Bird, Reptile
# Common Methods: feed, make_sound
# Polymorphism: Different make_sound implementations.

#Zoo Management
class Animal 
  attr_accessor :feed, :sound

  def initialize(feed, sound)
    @feed = feed
    @sound = sound 
  end

  def feed
    "eats: "
  end

  def sound
    "makes this sound: "
  end

  def intro
    "In this part of the zoo we have a "
  end
end

class Mammal < Animal
  attr_accessor :feed, :sound, :species, :skin
  def initialize(feed, sound, species, skin)
    super(feed, sound)
    @species = species
    @skin = skin
  end

  def feed
    super + "#{@feed}"
  end

  def sound
    super + "#{@sound}"
  end
  
  def intro
    super + "#{@species} with #{@skin} skin."
  end

end

class Bird < Animal
  attr_accessor :feed, :sound, :species, :skin
  def initialize(feed, sound, species, skin)
    super(feed, sound)
    @species = species
    @skin = skin
  end

  def feed
    super + "#{@feed}"
  end

  def sound
    super + "#{@sound}"
  end
  
  def intro
    super + "#{@species} with #{@skin} skin."
  end

end

class Reptile < Animal
  attr_accessor :feed, :sound, :species, :skin
  def initialize(feed, sound, species, skin)
    super(feed, sound)
    @species = species
    @skin = skin
  end

  def feed
    super + "#{@feed}"
  end

  def sound
    super + "#{@sound}"
  end
  
  def intro
    super + "#{@species} with #{@skin} skin."
  end

end

# mammal1 = Mammal.new("small animals","Ring-ding-ding-ding-dingeringeding","Fox","furry")
# puts mammal1.intro
# puts mammal1.feed
# puts mammal1.sound


# bird1 = Bird.new("seeds","Polly wanna cracker","Parrot","feathery")
# puts bird1.intro
# puts bird1.feed
# puts bird1.sound

# reptile1 = Reptile.new("Kaiju (other monsters)","RAWR xD","Godzilla","scaley")
# puts reptile1.intro
# puts reptile1.feed
# puts reptile1.sound

# mammal1 = Mammal.new("small animals","Ring-ding-ding-ding-dingeringeding","Fox","furry")
# bird1 = Bird.new("seeds","Polly wanna cracker","Parrot","feathery")
# reptile1 = Reptile.new("Kaiju (other monsters)","RAWR xD","Godzilla","scaley")

# animal = [mammal1, bird1, reptile1]

# animal.each_with_index do |animal, index|
#   puts "#{index +1}. #{animal.species}"
#   puts animal.intro 
#   puts animal.feed
#   puts animal.sound
#   puts "\n "
# end 

zoo = []

loop do 
  puts "Enter animal type: \n 1. mammal \n 2. bird \n 3. reptile \n"
  type =  gets.chomp.to_i
  puts "Species"
  species = gets.chomp
  puts "Feed:"
  feed = gets.chomp
  puts "Sound:"
  sound = gets.chomp
  puts "Skin type:"
  skin = gets.chomp

  case type
  when 1
    zoo << Mammal.new(feed, sound, species, skin)
  when 2
    zoo << Bird.new(feed, sound, species, skin)
  when 3
    zoo << Reptile.new(feed, sound, species, skin)
  else  
    "Invalid input. Please select from options 1 to 3."
    next
  end


  puts "Animals in the zoo:"
  zoo.each_with_index do |animal, index|
    puts "#{index +1}. #{animal.species}"
    puts animal.intro 
    puts animal.feed
    puts animal.sound
    puts "\n "
  end 

  puts "Would you like to add another animal?"
  continue = gets.chomp.downcase
  break unless continue == "yes"
end
