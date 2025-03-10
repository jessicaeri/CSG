rails is good for backend functions 

What weve been doing so far is internal APIs.
  External APIs is public APIs  
    ex: harry potter API you used last time 
    Public API list ()

    https://dev.to/sajankc/top-free-apis-without-an-api-key-120n
    
    https://github.com/public-api-lists/public-api-lists

#------------------------------------------
Using Net::HTTP (Built-In)
	•	Pros: Part of the Ruby standard library (no extra gems needed).
	•	Cons: More verbose; you often handle headers, parsing, etc., by hand.

require 'net/http' #don't need to run gem install
require 'json' # gem install json

# URL returning a single random joke
url = 'https://official-joke-api.appspot.com/random_joke'
uri = URI(url)

# Make the GET request
response = Net::HTTP.get(uri)

# Parse the JSON data
data = JSON.parse(response)

puts "Setup: #{data['setup']}"
puts "Punchline: #{data['punchline']}"

#-------------------------------------------
Using HTTParty (Gem)
	•	Pros: Cleaner syntax, easier handling of headers, and automatic JSON parsing.
	•	Cons: Requires adding a gem.

require 'httparty' #gem install httparty

response = HTTParty.get('https://official-joke-api.appspot.com/random_joke')
data = response.parsed_response

puts "Setup: #{data['setup']}"
puts "Punchline: #{data['punchline']}"

Exercise 1
Get the random joke http request working
Use another free and public api (preferably without an API key for now) and make other requests to them

Examples of where to find other apis:
https://dev.to/sajankc/top-free-apis-without-an-api-key-120n
https://github.com/public-api-lists/public-api-lists

Refer to wk_8_code.rb

Integrate external API into internal API

1. Create a controller
rails g controller trivia_questions

2. Edit Controller.rb
class TriviaQuestionsController < ApplicationController
  def show
    require 'httparty' #gem install httparty

    response = HTTParty.get('https://opentdb.com/api.php?amount=1')
    data = response.parsed_response

    question = data['results']

    question.each_with_index do |trivia, index|
      # puts trivia #shows what the data looks like
      puts "The category is: #{trivia['category']}"
      puts "#{trivia['question']}"
      
      # sleep(8)
      puts "\n"
      puts "----------------------------------------------"
      puts "The correct answer is: #{trivia['correct_answer']}"
     
    end

    render json: question
  end
end

3. Edit routes.rb
Rails.application.routes.draw do
  get '/trivia', to: 'trivia_questions#show'
end

4. Run Rails Server & httpie
http://localhost:3000/trivia
[
  {
    "type": "multiple",
    "difficulty": "medium",
    "category": "Mythology",
    "question": "Which of the following Mesopotamian mythological figures was NOT a deity?",
    "correct_answer": "Enkidu",
    "incorrect_answers": [
      "Enki",
      "Enlil",
      "Enkimdu"
    ]
  }
]

#----------------------------------

Using an API that requires an API key

Usually if API key is linked to a creditcard you dont want to share that key with anyone!!

ApplicationController
  def fetch_news
    require 'net/http'
    require 'json'

    url = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=6caa671f08d2416780d64776b320df6b}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    render json: data
  end
  
end

gem 'dotenv-rails'
bundle install #terminal 

creates .gitignore
can create a file .env #same level as app
input api key within file 

apiKey = "6caa671f08d2416780d64776b320df6b" 

class NewsController < ApplicationController
  def fetch_news
    require 'net/http'
    require 'json'

    url = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=#{ENV["apiKey"]}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    render json: data
  end
  
end

hides the API key while still getting the information

GET http://localhost:3000/news

Basically this hides sensitive information you want. 

#-----------------------------------------

