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
#   def initialize(name, age) #if wanting to add birthdate or anyother variable just add it in (name, age, birthdate) then obviously add @birthdate =  birthdate below
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
    # attr_reader :name, :age
    # puts person.name
    # puts person.age
#attr_writer :name = creates a setter method for variable
    #creates the data but doesn't allow the user to gain access to the data 
    # attr_writer :name, :age
    # person.name
    # person.age
#attr_accessor :name creates both getter and setter methods 
    # attr_reader :name, :age
    # attr_writer :name, :age
    # COMBINES everything

# class Person 
#   attr_accessor :name, :age

#   def initialize(name, age)
#     @name = name 
#     @age = age
#   end
# end

# person1 = Person.new("JessicaEri", 26)
# puts person1.name 
# puts person1.age
#     # JessicaEri
#     # 26

#---------------------------EXERCISE ----------------------------


# class Pet
#   attr_accessor :name, :nickname, :species, :birthyear

#   def initialize(name, nickname, species, birthyear) 
#       #technically do not need initialize method BUT it allows for a nicer display when inputting data
#     @name = name 
#     @nickname = nickname 
#     @species = species 
#     @birthyear = birthyear
#   end

#   def age
#     current_year = Time.now.year
#     current_year - @birthyear
#   end
# end

# pet1 = Pet.new("Moe", "MoeBeanz", "Felis catus", 2019)
# puts "#{pet1.name} (aka #{pet1.nickname}; sp.#{pet1.species}) is #{pet1.age} years old."
#       #Moe (aka MoeBeanz; sp.Felis catus) is 6 years old.

#--------------------------------------------------------------------------


# WORKOUT 
# Exercise, Sets, Rep, Intensity

# display: sets x reps 
# if rep range 10+ && intensity <5
#   puts "If available increase weight by (2.5-5lbs) and decrease rep range by 8-10."
# end
# end

class Workout
  attr_accessor :exercise, :weight, :sets, :reps, :intensity 

  def initialize(exercise, weight, sets, reps, intensity)
    @exercise = exercise 
    @weight = weight
    @sets = sets 
    @reps = reps 
    @intensity = intensity 
  end

  def reccomendation_sets_reps(intense)
    if @intensity < 6 
      puts "You're doing great! You're ready to increase your weight."
    else #intensity is more than 8
      puts "You're doing great! Stick with the weight!"
      #reps > 10 intensity > 8 #more than 10 reps high intensity 
      #reps < 10 intensity > 8 #low reps high intensity 
      # INTENSITY MATTERS MORE in this case keep it simple
    end
  end
  
end 


workout = []

loop do 
  puts "--------------------------------------------------------"
  puts "\n Workout Log \n"
  puts "--------------------------------------------------------"
  puts "\n Please choose from the following: \n"
  puts "1. Add an exercise"
  puts "2. List exercises"
  puts "3. Workout reccomendation(s)"
  puts "4. Exit"
  puts "\n"
  choice = gets.chomp.to_i
  puts "\n"
  puts "--------------------------------------------------------"

  case choice
  when 1
    puts "Please add in your exercise"
    exercise = gets.chomp.upcase
    puts "\n What weight did you use (lbs)?"
    weight = gets.chomp.to_i
    puts "\n How many sets did you do?"
    sets = gets.chomp.to_i
    puts "\n How many reps did you do?"
    reps = gets.chomp.to_i
    puts "\n What was your intensity level while doing #{exercise.downcase} (1-10)?"
    intensity = gets.chomp.to_i
    puts "\n"
    workout << Workout.new(exercise, weight, sets, reps, intensity)
    puts "Exercise added into your workout log!"
  when 2
    puts "\n Workout Log \n" # I would like to put date at some point but would need to incorporate hash instead. 
    workout.each_with_index do |wrkout, index|
      puts "#{index + 1}. #{wrkout.exercise} - Intensity level: #{wrkout.intensity}"
      puts "WEIGHT (lbs): #{wrkout.weight}"
      puts "SETS X REPS: #{wrkout.sets} X #{wrkout.reps}"
      puts " \n "
    end
  when 3
    if workout.empty?
      puts "No workouts logged yet!"
    else
      workout.each_with_index do |wrkout, index| #you have to call on the array
        puts "#{index + 1}. #{wrkout.exercise} - Weight: #{wrkout.weight}"
        puts wrkout.reccomendation_sets_reps(wrkout.intensity)
      end
    end
  when 4
    puts "\n Killed your workout!! Great job!!"
    break
  else 
      puts "Invalid choice. Please try again."
  end
  
end