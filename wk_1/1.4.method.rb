# --------------------- DAY 4 -------------------------------

# Question of the Day: Are you a morning a person or night owl?
# unfortunately a night owl not by choice. 

#Hotkey of the day: OPT (ALT)right or left arrow    AND Shift+Opt+left and right arrow for highlight

# ---------- DEF (Method) ------------------------

# def greet #helpful when running the function/code black/logic outside of working code document
#   puts "Hello"
# end

# greet 
#hello

#you can add parameters to def


# def greet(name) #(parameter)
#     puts "Hello #{name}"
# end

# greet("Charley")

# greet("Damen")

# def square(num)
#   puts "Square of #{num} = #{num**2}"
# end

# square(2)
# square (3) #also works when there is a space between def and ()

#usually with Methods you would use "return" instead of "puts"
# def square(num)
#   return "Square of #{num} = #{num**2}"
# end

# puts square(2) #Square of 2 = 4

#Also even when not putting return it implies "return"
# def square(num)
#   "Square of #{num} = #{num**2}"
# end

# puts square(2) #Square of 2 = 4

names = ["Jess", "Charley", "Audreana"]

# def greet(array) ##whatever variable name just has to be the same as ____.each
#   array.each do |names| #whatever variable name look below for comparison
#     p names
#   end
# end

# greet(names)

# "Jess"
# "Charley"
# "Audreana"

# def greet(x) 
#   x.each do |butter| 
#     p "Hi #{butter.upcase}!"
#   end
# end

# greet(names)

# "Hi JESS!"
# "Hi CHARLEY!"
# "Hi AUDREANA!"

# ------------------------EXERCISE----------------------------------
# list1 = [1, 2, 3, 4, 5, 6] #21
# list2 = [7, 8, 9, 10] #34

# def sum_array(x)
#   puts x.sum
# end

# sum_array(list1) #21
# sum_array(list2) #34
 #seems too simple maybe add at each step??

 # we use parameters because whatever is inside the function does not exist outside and vice versa
 
# def sum_array(x)
#   total = 0 #keeps track of the sum
#   x.each do |y|
#     total += y # 0 + (variable) + (next variable with array)
#   end
#   return total
# end

# p sum_array(list1) #21
# p sum_array(list2) #34
#------------------------------------------------------------

# numbers = [1, 2, 3, 4, 5]

# def get_even_number(num)
#   return num
# end

# p get_even_number(numbers)
# [1, 2, 3, 4, 5]

# def get_even_number(nums)
#   even_numbers = [] #empty array that we want to add to

#   nums.each do |n| #lists each 
#     if n.even? #.even? is a function verifying if its even 
#       even_numbers.push(n) #adds even numbers to even_numbers []
#     end
#   end

#   return even_numbers
# end

# p get_even_number(numbers)

# ------------------------EXERCISE----------------------------------

list_of_words = ["bake", "hoe", "short", "run", "glow", "fragile", "do"]

# def filter_short_words(words) #I want to remove words <= 3 "words" is the array that a use would input line 126
#   long_words =[] #array of words longer than 3

#   words.each do |w| #w is each of the index
#     if w.length > 3 #if word is greater than 3 # "w.length"
#       long_words.push(w) #add longer words to long_words [] #I don't need to put ".length" again since it implies from the "if" statement
#     end
#   # p w # used this to test words.each do
#   end
#   # p words #commented out each do and tested out long_words[]
#   return long_words #if I use return here use "p" or "puts" on line 141
# end

# p filter_short_words(list_of_words)

# def filter_short_words(words) #I want to remove words <= 3
#   long_words =[] #array of words longer than 3

#   words.each do |w|
#     if w.length > 3 
#       long_words.push(w) 
#     end
#   end
#   puts long_words #if I use "p" or "puts" here just use the defined function in line 156.
# end

# puts filter_short_words(list_of_words)

# ---------------- score grade only --------------------------
score_grade = [99, 91, 84, 72, 67, 59]

def grade_students(grade) #def convert score to letter
  letter_grade = [] #letter grade into array
  
  grade.each do |x| #listing each grade from array
    if x >= 90 
      puts "A"
    elsif x < 90 && x >= 80 
      puts "B"
    elsif x < 80 && x >= 70 
      puts "C"
    elsif x < 70 && x >= 60 
      puts "D"
    elsif x < 60
      puts "F"
    end
  end
  return letter_grade
end

# puts grade_students(score_grade)

student_and_grade = [
  ["Steph" ,[99]], 
  ["Beyonce", [91]], 
  ["Haley", [84]], 
  ["Solana", [72]], 
  ["Kehlani", [67]], 
  ["Sabrina", [59]]]

# puts student_and_grade

# student_and_grade.each do |student, grade| #ex. display steph and 99 together
#   puts "#{student}'s Grade: #{grade_students(grade)}" #displays it right next to eachother
# end
# #note printing correctly //A Steph's Grade: []

student_and_grade.each do |student, grade| #ex. display steph and 99 together
  puts "#{student}'s Grade:"
  puts grade_students(grade)
  puts "\n"
end
# everythign works but its displaying 
# method.rb:162:in `grade_students': undefined method `each' for nil:NilClass (NoMethodError)

# grade.each do |x| #listing each grade from array
#   ^^^^^
#    from method.rb:198:in `block in <main>'
#    from method.rb:196:in `each'
#    from method.rb:196:in `<main>'

#found it it did not have a "," next to Sabrina 

#Rubber ducky method - walk through your each step and make it super simple!

