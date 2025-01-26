#---------- WEBSITE TO DEFINE SHELL FUCNTIONS --------------------
#https://explainshell.com/

puts #prints out line
gets.chomp #any string after input gets printed on same line
"input".to_i #The function takes the number which is to be converted to int. (example 10.51_to.i => 10)
(no..no) #(no = number) defines a range from starting point to end (1..4 = 1, 2, 3, 4)
"input".to_a #creates an array
puts "input".to_a #prints range of numbers ((1..5).to_a => [1, 2, 3, 4, 5])
no.downto(no).to_a #reverse range (5.downto(1).to_a => [5, 4, 3, 2, 1])
no.step(no, no of steps) #produces range of no based off steps inputed (1.step(10, 2).to_a # => [1, 3, 5, 7, 9]; 10.step(1, -2).to_a # => [10, 8, 6, 4, 2])
[no..no].each { |n (or any variable name| puts "Current number is: #{n (or any variable name}" } #[1..3].each { |n| puts "Current number is: #{n}" } => Current number is: 1; Current number is: 2; Current number is: 3
input.sum # range = (1..5).to_a;sum = range.sum; puts sum => 15
#{variable} #interpolates but basically inputs definition of variable (name = Jessica; puts "My name is" #{name}."" => My name is Jessica.)
Float(variable) #shows product with a decimal rather than whole interger
variable.to_f #^^^ same as Float(variable)
downcase #changes all uppercase to lowercase
if condition 
  # code 
elsif another_condition 
  # code 
else 
  # code 
end
  > less than, < greater than, >= greater than equal to, <= less than equal to, == equal to, || or, && and
  #!= not equal to (word = "Fail" if word != "Success" puts "Great work!" else "puts "Try again" end) CASE SENSITIVE to avoid this if word.downcase != "success" (basically always downcase the product so it doesn't matter WONT WORK id != "Success")
  irb #interative ruby which 
loop do #Creates an infinite loop unless you use break.
break #Stops the loop immediately.
next #Skips the current iteration and moves on to the next.
#loop (input) do #continue to loop UNTIL condition is met if it does not say "break" it will continue forever until it crashes CTRL C will make it stop

# 3.times do
#   puts "Hello"
# end #=> Hello Hello Hello

# n=0
# while n < 10 
#   puts n 
#   n = n+1
# end
# #continues until before 10 basically breaks WHILE the statement is true

# n = 0
# until n== 10
#   puts "Hello"
#   n +=1 #n = n+1
# end #prints out until n ==1

# Step-by-Step Breakdown
# 1. Converting the Input to an Integer (input.to_i)
# .to_i tries to turn the input (string) into a number:
# If the input is a number, it converts it to an integer.
# Example: "42".to_i becomes 42.
# If the input is not a number, it turns into 0.
# Example: "abc".to_i becomes 0.
# 2. Converting Back to a String (to_i.to_s)
# Once we have the integer from .to_i, we turn it back into a string using .to_s:
# Example: 42.to_s becomes "42".
# 3. Comparing the Original Input with the Result
# Now, we check if the original input is the same as the string version of the number we converted:
# If they match, it means the input was a valid integer.
# Example: "42".to_i.to_s == "42" is true. The user entered a valid integer.
# If they don’t match, it means the input wasn’t a valid integer.
# Example: "123abc".to_i.to_s == "123abc" is false. The user entered something invalid.
# Another Example: "abc".to_i.to_s == "abc" is false.

#git add . - " . " adds all files
#git add -"file" adds that specific file 
#git commit - saves changes in local repository 
#git commit -m "file"- records changes to repository
#git pull - fetch from adn merge with another repository or local branch 
#git push - updates remote files 
#rm -rf .git - gemoves all git information



# .reverse to flip the text.
#  .split the sentence into an array of words, then .join it back into a string.
# .gsub to replace a specific word or character.
# .include? to check if a substring exists.

#[ARRAY] - display array in sequential order

# puts - prints 
#   1
#   2
#   3
# p - prints array the way it was typed [1,2,3]
# ex: number=[4,5,6]; p number[2] = 6 # arrays numbered as [0, 1, 2, 3, ....]


#array.select { |element| condition } 
#Parameters: The condition is defined using a block. Each element of the array is passed to the block, and if the block returns true, that element is included in the resulting array.
# Return Value: .select returns a new array containing the filtered elements and does not modify the original array.

# array.reject! { |element| condition }
# Parameters: The condition is typically defined using a block. Each element of the array is passed to the block, and if the block returns true, that element will be removed from the array.
# In-Place Modification: Because .reject! modifies the original array, it does not create a new array. This is different from .reject, which returns a new array without modifying the original.