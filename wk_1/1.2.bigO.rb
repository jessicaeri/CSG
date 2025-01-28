# ------ 1/21/2025: BigO --------
# Question of the day: What is one way we unwind?
# Answer: I like to play games Hogwarts Legacy.

#Hotkey of the day: 
#   git status - ensures that everything is workign properly, whether you added the correct file 
#   cmd t new - new tab
#   shift cmd t - brings back closed tab

#Big O notation
# Dependign on how much data, how long would it take for it to run?
# When writing an algorithm, we are trying to find an optimized version to run it? We want the least amount of steps to get to the end product.
# Array - structured group of data 

# 0(1) - Constant time - not affected by input size
#   same amount of time no matter the data size
# 0(n) - performance scales directly with the input size.
#   Example nested loops take longer to run but is beneficial for certain tasks.

#EXAMPLES
# def test #reusable code block that enables me to call on that method. Anywhere within the file I can use 
#   puts "I'm in the function"
# end

# puts test

# example: ".downcase" is a reusable code someone created and now is built into ruby for anyone to use.

# def const_t_ex
#   x=10
#   puts 10
# end

# const_t_ex

#REGARDLESS OF ANY INPUT TAKES THE SAME AMOUNT OF TIME

# def linear_t_ex(arr)
#   arr.each do |item|
#     10.times do
#       puts "I'm in the inner loop"
#     end
#   end
# end 

# linear_t_ex(|1, 2, 3, 4, 5|)

#as data is being passed in and data grows, the function would take longer to run 
#arr can be (1..3) or (1..1000) the latter would take longer
#or even if the loop becomes more complex it would take longer.

#----------------------------------------------------------------

#LOOPS
#While loops - will keep running as long as the condition is true

#  i= 0 #i=index
#  while i < 5
#    puts "Hello World"
#    i = i+1 #needs to be placed or the loop will run indefinitely.
#    #if not placed use cmd c to stop 
#  end

# Until loop 
# occurs until the condition becomes true 

# j = 5
# until j == 0 #countdown UNTIL j==0
#   puts "Until #{j}"
#   j-= 1
#   # j = j -1 STEPS DOWN
# end

#For loops
#repeats a section of code whatever times 

# for testing in 1..10 #1, 2, 3..10
#   puts "For loop: #{testing}"
# end

#Times loops 
#most straight forward 

#  5.times do 
#    puts "Hello"
#  end

#Each loop
# Array - structured group of data 
# loop through the collection and each time through the loop it will use the next item from the collection. 

# array = [1,2,3,4,5]
# words = ["one", "two", "three"]
# array.each do |num|
#   puts num
# end

# i = 0 
# while i < words.length #basically while the value of i is less than the number of words the function will run.
#   puts array[i]
#   i+=1
# end