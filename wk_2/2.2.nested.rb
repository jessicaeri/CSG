# --------------------- DAY  7: NESTED DATA -------------------------------

# Question of the Day: What am I most passionate about besides coding?
# Conservation 

#Hotkey of the day: Clicking on the book button in the top right hand corner makes it 2 windows in VSCode


# board = [
#   [' ',' ',' '], #X|O|X
#   [' ',' ',' '], # |O|
#   [' ',' ',' ']  #X|O|
# ]

# puts "Welcome to our tic-tac-toe game!! \n Where would you like to start? "

# # p board 
# board[0][0] ='X'
# board[1][1] ='O'
# board[0][2] = 'X'
# board[0][1] = 'O'
# board[2][0] = 'X'
# board[2][1] = 'X'
# board[1][0] = 'O'
# p board 

# grid = [
#   [1,2,3],
#   [4,5,6],
#   [7,8,9]
# ]

# grid.each do |index|
#   puts index
# end
# #entire index

# grid.each do |a, b, c|
#   p a # 147
#   p b # 258
#   p c # 369
# end
# #pritns abc, abc2, abc3

# grid.each do |number|
#   #prints 1
#   number.each do |num|
#     p num
#   end
#    #prints 23
# end

#----------------------------- NESTED HASH----------------------------

# person = {
#   name: "Alice",
#   contact: {
#     email: "alice@gmail.com",
#     phone: "123-456-789"
#   },
#   address: {
#     street: "123 Main st",
#     city: "Wonderland",
#     zip: "12345"
#   }
# }
#   #print zipcode
# p person[:address][:zip]
# #\\"12345"
# p person[:contact]
# #\\{:email=>"alice@gmail.com", :phone=>"123-456-789"}

#-------------------------- EXERCISE -----------------------------------------------
# Task: Create a hash representing a student with nested information.
# Instructions:
# Create a file named nested_data.rb.
# Include keys for :name, :grades (hash of subjects and scores), and :contact (hash with :email and :phone).
# Access and print specific nested values.

# student = {
#   name: "Alice",
#   grades: {
#     math: 90,
#     literature: 87,
#     science: 66
#   },
#   contact: {
#     email: "alice@gmail.com",
#     phone: "123-456-789"
#   }
# }

# puts student[:name] #\\ Alice
# puts student[:grades][:math] #\\90
# puts student[:contact][:phone] #\\123-456-789

#----------------------------------------------------------------------------------------

#How do I get each of the grades and scores

# student[:grades].each do |subject, score|
#   puts subject, score
# end
# # math
# # 90
# # literature
# # 87
# # science
# # 66

# student[:contact].each do |contact, info|
#   puts "#{contact}: #{info}"
# end
# #email: alice@gmail.com
# #phone: 123-456-789
 
#----------------------------- EXERCISE --------------------------------------
# Task: Write a program that iterates over a hash of multiple students, each with their own nested hashes.
# Instructions:
# Define a hash where each key is a student's name, and the value is a hash of their grades.
# Iterate over each student to display their grades.

# students = {
#   alice: { math: 90, science: 95 },
#   bob: { math: 85, science: 80 },
#   carol: { math: 92, science: 88 }
# }

# students.each do |name, grade| #outer "alice", inner "report card" (math and science)
#   puts "#{name}:"
#     grade.each do |subject, score| #outer "math", inner "score"
#       puts "#{subject}: #{score}"
#     end
#     puts " \n "
# end

# alice:
# math: 90
# science: 95
 
 
# bob:
# math: 85
# science: 80
 
 
# carol:
# math: 92
# science: 88

# students_alt = {
#   alice: { grades: {math: 90, science: 95}, contact: {phone: 123456, email: "alice@gmail.com"} },
#   bob: { grades: {math: 85, science: 80}, contact: {phone: 123456, email: "bob@gmail.com"} },
#   carol: { grades: {math: 92, science: 88}, contact: {phone: 123456, email: "carol@gmail.com"} }
# }
# students_alt.each do |student, info| #PEELING AN ONION!!!!!!!
#   puts "#{student}:"
#   info.each do |info, specified_info|
#     puts "  #{info}:"
#     specified_info.each do |x,y|
#       puts "    #{x}: #{y}"
#     end
#   end
# end

#----------------------------------------------------------------------------------------

# students = {
#   alice: { math: 90, science: 95 },
#   bob: { math: 85, science: 80 },
#   carol: { math: 92, science: 88 }
# }

#How would I change carol's grade

# p students
# {:alice=>{:math=>90, :science=>95}, :bob=>{:math=>85, :science=>80}, :carol=>{:math=>92, :science=>88}}

# students[:carol][:science] = 45
# p students
# {:alice=>{:math=>90, :science=>95}, :bob=>{:math=>85, :science=>80}, :carol=>{:math=>92, :science=>45}}

#HOW WOULD I DELETE THE ALICE'S SCIENCE GRADE

# students[:alice].delete(:science)
# p students
# {:alice=>{:math=>90}, :bob=>{:math=>85, :science=>80}, :carol=>{:math=>92, :science=>88}}

#how would I add PE to bob?
# students[:bob][:pe] = 100 #basically just add another [:]
# p students
# {:alice=>{:math=>90, :science=>95}, :bob=>{:math=>85, :science=>80, :pe=>100}, :carol=>{:math=>92, :science=>88}}

# students_alt = {
#   alice: { grades: {math: 90, science: 95}, contact: {phone: 123456, email: "alice@gmail.com"} },
#   bob: { grades: {math: 85, science: 80}, contact: {phone: 123456, email: "bob@gmail.com"} },
#   carol: { grades: {math: 92, science: 88}, contact: {phone: 123456, email: "carol@gmail.com"} }
# }
# # how would I change carol's science grade now?
# students_alt[:carol][:science] = 45
# p students_alt
# # {:alice=>{:grades=>{:math=>90, :science=>95}, :contact=>{:phone=>123456, :email=>"alice@gmail.com"}}, :bob=>{:grades=>{:math=>85, :science=>80}, :contact=>{:phone=>123456, :email=>"bob@gmail.com"}}, :carol=>{:grades=>{:math=>92, :science=>88}, :contact=>{:phone=>123456, :email=>"carol@gmail.com"}, :science=>45}}

#----------------------------- EXERCISE --------------------------------------------
# Task: Update your students hash to:
# Add a new key-value for another subject and grade.
# Update one of the grades.
# Remove a subject.


students = {
  alice: { math: 90, science: 95 },
  bob: { math: 85, science: 80 },
  carol: { math: 92, science: 88 }
}

# students[:alice][:literature] = 67
# students[:bob][:science] = 99
# students[:carol].delete(:literature)
# puts students

#\\{:alice=>{:math=>90, :science=>95, :literature=>67}, :bob=>{:math=>85, :science=>99}, :carol=>{:math=>92, :science=>88}}

products = [
  {name: "Laptop", price: 1000, tags: ["electronics","computers"]},
  {name: "Book", price: 20, tags: ["education","literature"]},
  {name: "Coffee Mug", price: 10, tags: ["kitchen","beverage"]}
]

#How would you print out "computers"
puts products[0][:tags][1] #\\computers

