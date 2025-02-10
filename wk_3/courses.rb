#----------------------- Week 3: Project ---------------------------------------
# Homework Assignment
# Technical Assignment:
# Create a Student Management System in Ruby. You’ll define a Student class and a Course class, then allow students to enroll in courses and display their information. Below are the steps for completing the core project—and bonus tasks for going above and beyond.

class Course
  attr_accessor :course_code, :course_name, :enrolled_students

  def initialize(course_code, course_name) #initializes course code and name, but also initializes array for enrolled students within course
    @course_code = course_code
    @course_name = course_name
    @enrolled_students = []
  end

  def display_info #displays course info
    puts "Course code: #{course_code.upcase}"
    puts "Course: #{@course_name} \n "
  end

  def list_students 
    if @enrolled_students.empty? #if array is empty displays no students enrolled
      puts "No students enrolled in this course."
    else  #if NOT empty displays students within the course 
      puts "Student enrolled in #{@course_name}:"
      @enrolled_students.each do |student|
        puts "  #{student.display_info}"
      end
    end
  end

end