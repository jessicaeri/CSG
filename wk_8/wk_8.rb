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
 
Week 8.2 SIDEKIQ 
Sidekiq 
  - basically allows you to run two programs/servers at once 
  - longer loading/running programs would be ran in the BACKGROUND (sidekiq)
      while the shorter programs could be ran on the server
  - For apps, it would better the user experience 

How to run?

1. run these global commands (once per computer)
  brew install redis 
  brew services start redis

2. Install/run sidekiq
gem 'sidekiq'
bundle install 

3. create and set up sidekiq initializer
config/sidekiq.rb 

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] || 'redis://localhost:6379/0' }
end

4. create worker folder in app folder
app/worker 

5. create methodname_worker.rb file 
ex: hard_worker.rb 
class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    sleep(count)
    puts "Hello #{name}"
  end
end

6. call for worker file in controller (also set up seeds if you are testing)

  seeds.rb
  user = User.create(
  name: "Leon"
  )

  i = 0
  10.times do
    Product.create(
      name: "Product #{i}",
      price: i,
      category: "test",
      user_id: user.id
    )
    i += 1
  end

  controller.rb
class ProductsController < ApplicationController
  def index
    HardWorker.perform_async("Leon", 3)

    products = Product.all
    render json: products
  end
end

different perform functions
class ProductsController < ApplicationController
  def index
    # perform_async(*args)
      HardWorker.perform_async("Leon", 3, 1, 2, 3, 4, 5)
          - runs async. runs when it gets the chance to.
          - "Run this task as soon as possible, but you dont have to do it right now."
          - task added to a queue, and Sidekiq will run it when theres an available worker.
          - Youre not controlling when it runs, just saying, "Please do this when you can."
    # perform_in(interval, *args)
      HardWorker.perform_in(10.seconds, "Leon", 3, 1, 2, 3, 4, 5)
          - "Wait 10 seconds, then run the task"
          - wont be executed immediately, instead its SCHEDULED 
    # perform_at(interval, *args)
      HardWorker.perform_at(1.day.from_now, Leon, 3)
      - "Run this task at exactly this time in the future."
      - Insead of waiting for a random time, it is scheduled for a SPECIFIC moment.
    

    products = Product.all
    render json: products
  end
end

7. run and execute 
terminal (any):
rails db:create
rails db:migrate

terminal 1: rails s
terminal 2: bundle exec sidekiq

#--------------------------------------------------
