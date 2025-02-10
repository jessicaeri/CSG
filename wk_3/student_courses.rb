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

class Student 
  attr_accessor :name, :student_id, :courses

  def initialize(name, student_id)
    @name = name 
    @student_id = student_id 
    @courses = []
  end

  def display_info #displays student info
    puts "Student: #{@name} - #{@student_id} \n "
  end

  def enroll(course)
    if @courses.include?(course) #if it includes course then will say message AND will not add
      puts "Already enrolled in #{course.course_code}: #{course.course_name} \n"
    else 
      @courses << course #adds input into array
      course.enrolled_students << self #adds the student into enrolled students array "student1.enroll(course1)" 
        #student1 information added into enrolled students array.
      puts "Enrolled in #{course.course_code}: #{course.course_name}." 
    end
  end

  def unenroll(course)
    if @courses.delete(course) #deleted specific course
      course.enrolled_students.delete(self) #if course deleted. will also deleted the student information from enrolled students array. 

          #student1.unenroll(course1) - removes student information from enrolled students
      puts "Unenrolled from #{course.course_code}: #{course.course_name}."
    else
      puts "Not enrolled in #{course.course_code}: #{course.course_name}."
    end
  end

  def list_courses
    if @courses.empty?
      puts "No courses enrolled."
    else 
      puts "Enrolled Courses:"
      @courses.each do|course|
        puts "- #{course.course_code}: #{course.course_name}"
      end

    end 
    
  end

end



student1 = Student.new("Jessica","AB1234")
student1.display_info

student2 = Student.new("Billy","BC2345")
student2.display_info

course1 = Course.new("BI100", "Environmental Biology")
course2 = Course.new("EN111", "Research Writing")

course1.display_info
course2.display_info

student1.enroll(course1)
student1.enroll(course2)
student2.enroll(course2)

student1.enroll(course1)

student1.list_courses

student1.unenroll(course1)

student1.list_courses

course2.list_students
course1.list_students