#------------------ Day 8: Activity ------------------------
# Exercise: Membership ID Checker
# Goal: Validate a user’s membership ID against a known list of valid IDs, using Ruby’s error-handling features.
# Scenario
# Imagine you have a small club or service with a few valid membership IDs. A user must enter a valid ID to proceed. If they fail multiple times, the program refuses access.
# Requirements:
# Create a file named membership_checker.rb.
# Define a custom exception class, e.g. InvalidMembershipError.
# Store valid IDs in an array (e.g., ["AB123", "CD456", "EF789"]).
# Prompt the user for their membership ID.
# Raise an InvalidMembershipError if the entered ID is not in the valid list.
# Rescue this error, retry up to 3 attempts, then exit if still invalid.
# Use ensure to print a final message (e.g., "ID check finished."), regardless of success or failure.

class InvalidMembershipError < StandardError 
end

valid_ids = ["AB123", "CD456", "EF789"]

# def check_membership
  attempts = 0

begin 
  attempts += 1
  print "Enter your membership ID:"
  user = gets.chomp

  raise "Invalid Membership ID. Scan a valid ID." unless valid_ids.include?(user)
  
  puts "Welcome member ID:#{user}!!" 
  return user

rescue => e
  puts e.message
  
  if attempts < 3
      retry
  else 
    puts "Failed after 3 attempts. Please see counter for assistance."
  end

ensure 
  puts "\n Membership checked."

end





























#Exercise: ATM Withdrawal Simulator
# Goal: Practice error handling in Ruby by simulating a simple withdrawal from a bank account.
# Requirements:
# Create a file named atm_simulator.rb.
# Prompt the user to enter a withdrawal amount.
# Use a starting balance (e.g., balance = 100.0) that the user cannot exceed.
# Validate the user’s input:
# Must be a valid number (no letters or symbols besides digits and an optional decimal).
# Must not be negative or zero.
# Must be less than or equal to the current balance.
# Raise exceptions for invalid input or insufficient balance.
# Rescue these errors, prompt the user again using retry, but limit how many times you’ll retry to avoid infinite loops.
# Ensure a final message is always printed, such as "Transaction finished."
# Print the new balance if the withdrawal succeeds.