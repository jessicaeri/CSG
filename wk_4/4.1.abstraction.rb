# --------------------- WEEK 4.1 - DAY  16 -------------------------------

# Question of the Day: What hobby did you recently pick up or are trying to pick up?
# - KITE SURFING

#Hotkey of the day: Cmd/Ctrl + L - selects the entire line that your cursor is on.
#-----------------------------------------------------------------

#----------------------- ABSTRACTION -------------------
  # hide any complex logic/implementtaion details
  # also hides anything the user might not need
  # simplfies it so that user can use it so taht they understand it 

  #Steering wheel concept - steers vehicles but we dont know whats going on in the engine

# class CoffeeMachine
#   def make_coffee(type)
#     boil_water
#     brew_coffee(type)
#     pour_in_cup
#     add_sugar_and_milk
#     puts "#{type.capitalize} is ready." #whatever type coffee user inputed is ready
#   end

#   private #only accessible in the class

#   def boil_water
#     puts "Boiling water ..."
#   end

#   def brew_coffee(type)
#     puts "Brewing #{type} coffee ..."
#   end

#   def pour_in_cup
#     puts "Pouring coddee into the cup ..."
#   end

#   def add_sugar_and_milk
#     puts "Adding sugar and milk ..."
#   end

# end

# machine = CoffeeMachine.new 
# machine.make_coffee("espresso")

#machine.boil_water #cannot have access since its under private UNLESS WHEN CALLED accessible class/method/def

#----------------------- EXERCISE ----------------------------
# Task: Practice creating private methods
# Instructions:
# Define a class of your choice
# Create one method that isn't private, that calls the private methods you will be creating.
# Use the 'private' method to make 2-3 private methods
# Instantiate an object of your class and test it

# class Litter
#   def  maintain_litter(type)
#     check_litter
#     scoop_litter 
#     dispose_organic_matter
#     add_baking_soda
#     mix_litter
#     return " #{type.capitalize} litter is cleaned"
#   end

#   private
#   def check_litter
#     puts "checking litter ..."
#   end

#   def scoop_litter
#     puts "scooping organic matter ..."
#   end

#   def dispose_organic_matter
#     puts "disposing organic matter ..."
#   end

#   def add_baking_soda
#     puts "adding baking soda to litter ..."
#   end

#   def mix_litter
#     puts "mixing litter ..."
#   end

# end

# litter = Litter.new
# litter.maintain_litter("cat")

#--------------------------------------------------------------

#-------------------------ENCAPSULATION-------------------
    #hiding internal data,'
    #hides unneccesary data

# class BankAccount
#   def initialize(owner, balance)
#     @owner = owner
#     @balance = balance
#   end

#   # Public method: anyone can call these
#   def deposit(amount)
#     @balance += amount
#   end

#   def withdraw(amount)
#     if sufficient_funds?(amount)
#       @balance -= amount
#     else
#       puts "Insufficient funds!"
#     end
#   end

#   private

#   # Private method: only the class itself can call this
#   def sufficient_funds?(amount)
#     amount <= @balance
#   end
# end

# bankaccount = BankAccount.new("Jessica", 500)
# puts bankaccount.withdraw(100) 
#     #400
# puts bankaccount.deposit(200)
#     #600
# puts bankaccount.withdraw(800)
#     #Insufficient funds!

# #----------------------------------- EXERCISE -------------------------
# # Task: Create a Library class that manages books.
# # Instructions:
# # Define a Library class with methods to add and remove books.
# # Use private methods to handle internal operations like updating the database.
# # The user should interact with simple methods like borrow_book and return_book.

require 'json'

class Library  
  def initialize(file_name = "library.json")
    file_name = file_name
    load_database 
  end

  def add_book(book)
    @library << book 
    puts "#{book} has been added to the library"
    update_database
  end

  def return_book(book)
    if @library.include?(book) #
      puts "#{library.title} has already been returned"
    else 
      @library << book 
      puts "#{library.title} has been returned"
      update_database
    end
  end

  def borrow_book(book)
    if @library.include?(book) #
      @library.delete(book)
      puts "Enjoy your read!"
      update_database
    else 
      puts "Sorry #{library.title} this is not available"
    end
  end

  private
  
   # Load the list of books from a JSON file (if it exists)
   def load_database
    if File.exist?(@file_name) 
      file_contents = File.read(@file_name)
      @books = JSON.parse(file_contents)
    else
      @books = []
    end
   end

  # Write the current list of books to the JSON file
  def update_database
    File.open(@file_name, 'w') do |file|
      # Using 'pretty_generate' for readability
      file.write(JSON.pretty_generate(@books))
    end
  end
end


library = Library.new

library.add_book("1984")
library.add_book("Brave New World")
library.borrow_book("1984")
library.return_book("1984")

#--------------------------------------------------------

#Composition - class composed of one or more objects from another class 
    #usually it would be use for classes that are very related to to each 
    #depending on the logic you're trying to solve

# class Engine 
#   def start
#     puts "Engine is starting"
#   end
# end

# class Wheels
#   def roll
#     puts "Wheels are rolling"
#   end
# end

# class Car
#   def initialize
#     @engine = Engine.new 
#     @wheels = Wheels.new
#   end

#   def drive 
#     @engine.start
#     @wheels.roll
#     return "Car is moving!"
#   end
# end

# # engine = Engine.new 
# # engine.start

# # wheels = Wheels.new 
# # wheels.roll 

# car = Car.new
# car.drive

#----------------------------EXERCISE------------------------------------------
# Instructions
# Create a Battery class
    # It could have a method like charge that prints "Battery is charging...".
# Create a Storage class
    # It could have a method like read_data that prints "Reading data from storage...".
# Create a Laptop class
    # It should instantiate its own Battery and Storage objects in the initialize method. This shows composition—the Laptop “owns” these parts.
# Provide methods like power_on and load_files:
    # power_on should call the charge method on @battery and then print something like "Laptop powering on...".
    # load_files should call the read_data method on @storage and then print something like "Files loaded into memory.".
# Test Your Laptop
# Create a new Laptop instance.
# Call power_on and load_files on it.
# Observe the output to confirm the classes are working correctly together.

# class Battery 
#   def charge
#     puts "Battery is charging ..."   
#   end
# end

# class Storage
#   def read_data
#     puts "Reading data from storage ..."
#   end 
# end

# class Laptop
#   def initialize
#     @battery = Battery.new 
#     @storage = Storage.new
#   end

#   def power_on
#     @battery.charge
#     puts "Laptop is powering on"
#   end

#   def load_files 
#     @storage.read_data
#     puts "Files loaded into memory."
#   end
# end

# laptop = Laptop.new
# laptop.power_on
# laptop.load_files

#----------------------------------------------------------

#Agreggation - class
    #

# class Player
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def display
#     puts "Player: #{@name}"
#   end
# end

# class Team
#   def initialize(name)
#     @name = name
#     @players = []
#   end

#   def add_player(player)
#     @players << player
#     puts "#{player.name} has joined #{@name}."
#   end

#   def show_team
#     puts "Team: #{@name}"
#     @players.each { |player| player.display }
#   end
# end

# player1 = Player.new("Charles")
# player2 = Player.new("Damen")

# team = Team.new("Chamorro Chip Cookies")

# team.add_player(player1)
# team.add_player(player2)

#------------------------------EXERCISE------------------------------------------------
# Task: Create classes to model a Computer composed of CPU, Memory, and Storage.
# Instructions:
# Define classes CPU, Memory, and Storage with simple methods.
# Create a Computer class that composes these components.
# Implement a method start_computer that calls methods from the components.

class CPU
  def process
    puts "processing ..."
  end
end

# cpu = CPU.new 
# cpu.process

class Memory 
  def remember 
    puts "remembering ..."
  end
end

# memory = Memory.new
# memory.remmeber

class Storage 
  def store 
    puts "pulling up storage ..."
  end
end

# storage = Storage.new 
# storage.store

class Computer 
  def initialize 
    @cpu = CPU.new  
    @storage = Storage.new 
    @memory = Memory.new
  end

  def start_up(user)
    puts "Starting up computer."
    @cpu.process
    @memory.remember
    @storage.store
    puts "Welcome #{user}! Please Sign in."
  end
end

# computer = Computer.new
# computer.start_up("Jess")

#--------------------------------------------------------------------------------

# Creational (e.g., Singleton, Factory)


# Singleton Pattern:
  # Ensures a class has only one instance.
  # Provides a global point of access to that instance.

  # Common Uses: Loggers, configuration managers, caches, and other system-wide resources that should be unique.



# class Logger
#   @@instance = Logger.new

#   private_class_method :new

#   def self.instance
#     @@instance
#   end

#   def log(message)
#     puts "Log: #{message}"
#   end
# end

# logger1 = Logger.instance
# logger2 = Logger.instance

# logger = Logger.new

# logger1.log("This is a log message.")

# puts logger1.object_id == logger2.object_id  # Outputs: true




# Access Control Methods:
# public: Methods are accessible from outside the class.
# private: Methods are only accessible within the class.
# protected: Methods are accessible within the class and its subclasses.







#-----------------------------------------GITHUB----------------------------------------

#HOMEWORK: 
  #from now on homework will have its own repositiory

#git branch 
    # * main 
      #this is where all the clean code would go to 
#git branch - view branches 
#git checkout - go to branch
#git checkout -b branchingDemo - creates a new branch and sets it to that branch 


#think of branching like a literal tree 
    #main - trunk very pretty 
    #branch (projects/different aspects of a project) - lots of branches and messy 
    #
  