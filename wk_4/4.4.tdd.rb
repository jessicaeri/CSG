# --------------------- WEEK 4.4 - DAY  19 -------------------------------

# Question of the Day: How do we stay active?
    #diveee

#Hotkey of the day: 

#-----------------------------------------------------------------

#Test Driven Development (TDD)- 

class Calculator
    def add(a, b)
        puts "Sum = #{a + b}"
    end

    def subtract(a, b)
        puts "Difference = #{a - b}"
    end

    def multiply(a, b)
        puts "Product = #{a * b}"
    end

    def divide(a, b)
        puts "Quotient = #{a / b}"
        puts "   w/ a remainder of #{a % b}"
    end
end

#depending on your workflow and way of thinking this can be advantageous... 

calculator = Calculator.new 

calculator.add(2,3)
calculator.subtract(2,3)
calculator.multiply(2,3)
calculator.divide(2,3)