# 03/10/2025 -----------------------------
# Exercise 1
# Get the random joke http request working
# Use another free and public api (preferably without an API key for now) and make other requests to them

# Examples of where to find other api's:
# https://dev.to/sajankc/top-free-apis-without-an-api-key-120n
# https://github.com/public-api-lists/public-api-lists

# require 'httparty' 

# response = HTTParty.get('https://official-joke-api.appspot.com/random_joke')
# data = response.parsed_response

# puts "Setup: #{data['setup']}"
# puts "Punchline: #{data['punchline']}"

#// Setup: Why don't skeletons fight each other?Punchline: They don't have the guts.

require 'net/http' #don't need to run gem install
require 'json' # gem install json

# URL returning a random taco dish
url = 'https://opentdb.com/api.php?amount=1'
uri = URI(url)

# Make the GET request
response = Net::HTTP.get(uri)

# Parse the JSON data
data = JSON.parse(response)

# puts "Base layer: #{data['setup']}"
# puts "Mixin: #{data['punchline']}"

# pp data #pretty print 

#good to know what the data looks like 
# print raw data 
# puts data #shows that it was an array 

# 0
# ["results", [{"type"=>"multiple", "difficulty"=>"medium", "category"=>"Entertainment: Video Games", "question"=>"The default playermodel of Garry&#039;s Mod is this Half Life 2 character.", "correct_answer"=>"Isaac Kleiner", "incorrect_answers"=>["G-Man", "Alyx Vance", "Gordon Freeman"]}]]
# 1

question = data['results'] #is where it was at but make it into a variable to pull it within the each_with_index loop

question.each_with_index do |trivia, index|
  # puts trivia #shows what the data looks like
  pp "The category is: #{trivia['category']}"
  pp "#{trivia['question']}"
  
  sleep(8)
  puts "\n"
  puts "----------------------------------------------"
  pp "The correct answer is: #{trivia['correct_answer']}"
  pp "Difficulty: #{trivia['difficulty']}"
end

# "The category is: Geography"
# "Where would you find the &quot;Spanish Steps&quot;?"

# ----------------------------------------------
# "The correct answer is: Rome, Italy"
# "Difficulty: easy"

#can remove &quot; based off the language was stored