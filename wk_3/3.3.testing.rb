# --------------------- WEEK 3.3 - DAY  13 -------------------------------

# Question of the Day: Goal fo the year? Get a second job in software development/engineering

#Hotkey of the day: CMD + K or "clear" in terminal - clears terminal

#-----------------------------------------------------------------

#testign with Rspec 

#manual testing 
#automated testing - generate and run those tests to ensure that if something breaks we'd know what exactly made the function fail

#Rspec allows for readible tests and testible tests 

#class Calculator
# def add(a, b)
#   a+b
# end

# end

# calc = Calculator.new 
# puts calc.add(1,2) #3

    #example of manual testing 

#we want to automate the testing so install Rspec

#in terminal: gem install rspec
#run command: rspec --init
    #creates two files that gives you a guide and idk what the other one was.
    #we should create a file within the folder.

    #-----------------------------EXERCISE-------------------
    # Exercise:
    # Instructions:
    # Create a new Ruby file named calculator.rb. 
            #3.3.testing.rb
    # Create a calculator class with an add method
    # Manually test it to make sure everything is working
    # In your terminal, run gem install rspec to install rspec
    # Then run rspec --init to initialize rspec in that folder
    # Create the rspec tests in a file called calculator_spec.rb in the spec folder to test the add method you just created
    # Run the tests by typing in rspec in your terminal

# class Calculator
#   def add(a, b)
#     a+b
#   end
#   def
# end

# calc = Calculator.new 
# puts calc.add(1,2) #3

# puts calc.add(3,5) #8 when running "rspec" in terminal

#-------------------- TEST Person Class ----------------
# class Person 
#   attr_accessor :name, :age #setter adn getter
#   #should practice putting this all the time for TESTING (RSpec)

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
#       #won't need to attr :name and :age since we're inheriting from superclass Person 

#   def initialize(name, age, grade_level)
#     super(name, age)
#     @grade_level = grade_level
#   end

#   def introduce #getter
#     "#{super} I am currently a #{@grade_level} grader."
#   end
# end

# class Teacher < Person 
#   attr_accessor :teach_subject
#   def initialize (name, age, teach_subject)
#     super(name, age)
#     @teach_subject = teach_subject
#   end

#   def introduce #getter
#     super + " I am currently teaching #{@teach_subject}."
#   end
# end

# student_1 = Student.new("Simba", 8, "4th") 
# puts student_1.introduce

# teacher_1 = Teacher.new("Kaiju", 28, "P.E.") 
# puts teacher_1.introduce

#---------------------------------------------

#if you want to test a specific file run this command in terminal:
      #rspec spec/ TAB
          #shows the file options
          #can cycle through using TAB 

# ~/Desktop/CSG/wk_3 % rspec spec/
# calculator_spec.rb  person_spec.rb      spec_helper.rb  

#---------------------------------------------

class Person 
  attr_accessor :name, :age 

  def initialize(name, age) # setter
    raise ArgumentError, 'Age must be a positive number' if age < 0
    @name = name
    @age = age
  end

  def introduce #getter
    "Hello my name is #{@name} and I am #{@age}!" #we don't always want to print/puts it out but ALWAYS return
  end
end

person = Person.new("Jess", 26)
puts person.age

class Student < Person 
  attr_accessor :grade_level
      #won't need to attr :name and :age since we're inheriting from superclass Person 

  def initialize(name, age, grade_level)
    super(name, age)
    @grade_level = grade_level
  end

  def introduce #getter
    "#{super} I am currently a #{@grade_level} grader."
  end
end

class Teacher < Person 
  attr_accessor :teach_subject
  def initialize (name, age, teach_subject)
    super(name, age)
    @teach_subject = teach_subject
  end

  def introduce #getter
    super + " I am currently teaching #{@teach_subject}."
  end
end

# student_1 = Student.new("Simba", 8, "4th") 
# puts student_1.introduce

# teacher_1 = Teacher.new("Kaiju", 28, "P.E.") 
# puts teacher_1.introduce

