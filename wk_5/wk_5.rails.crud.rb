# --------------------- WEEK 5.1 - DAY  21 -------------------------------

# Question of the Day: Small town or big city?
# - Big city bc I love the anonymity 

#Hotkey of the day: Cmd-TAB (don't hold down) - swithc through applications
#-----------------------------------------------------------------

#-------------VIDEOS--------------
    #Computer Science explained in 17mins:
    #Backend web development - a complete overview 
        #SuperSimpleDev

#RUBY ON RAILS 

https://httpie.io/
  #to test!!

# In your my_api application we created last week:
  # run the server and make sure it's working by going to localhost:3000

  # go to your routes.rb and create the /products route (get '/products' => 'products#index' )
    #Example:
    #Config - >Routes.rb

        Rails.application.routes.draw do
          get '/products' => 'products#index'
        end
        #HAS TO BE PLURAL "products"


  # create a new products controller by running rails generate controller products in your terminal
  
      #in terminal : rails generate controller products     
          # ~/Desktop/CSG_MAIN/CSG.course/my_api % rails generate controller productscd my_api
          #       create  app/controllers/productscd_controller.rb
          #        route  get "productscd/my_api"
          #       invoke  test_unit
          #       create    test/controllers productscd_controller_test.rb

  # create the index method in your products controller
    #productscd_controller.rb
      class ProductscdController < ApplicationController
        def index
          puts "Welcome Jeshka!"
        end
      end
# test it by 

      #RUN SERVER
          #terminal : rails server
      #going to https://localhost:3000/products in your browser and checking your server to see the 'Hello World'
      
# Routing:
    # Maps HTTP requests to controller actions.

# Controllers:
    # Contain actions (methods) that handle requests.


#Make another Controller

Rails.application.routes.draw do
  get '/products' => 'products#index'

  get '/students' => 'students#check'
end


    terminal: rails generate controller students

class StudentsController < ApplicationController
  def check
    puts "-------------------------------"
    puts "I'm in the students controller"
    puts "-------------------------------"
  end
end

Rails.application.routes.draw do
  get '/products' => 'products#index'

  get '/students' => 'students#check'

  get '/dogs' => 'dogs#bark'
end

class DogsController < ApplicationController
  def bark
    puts "bow wow"
    puts "woof woof"
  end
end

#------------------------------------------

#Migrations 

What is a Model?
    A model in Rails is a Ruby class that represents one type of data in your application—often a table in your database. Models define:
      Which columns/fields exist for that data (e.g., name, price for products).
      Business logic related to the data (like validations and custom methods).
      Relationships to other models (e.g., a product belongs_to a category).
    In short, a model is the Ruby object that lets you read and write data in the database without writing raw SQL queries.
What is a Migration?
    A migration is a special Ruby file that tells Rails how to change the structure of your database. For example, when you create a migration to add a “products” table, Rails will:
        Generate a file containing instructions to create that table and specify its columns.
        Store a record of that migration so it won’t be run again accidentally.
    Migrations let you version-control your database schema—meaning as your app grows, you’ll add or modify tables by creating more migrations, rather than manually tinkering with SQL commands.

# Create the Product model by running 
#   rails generate model Product name:string price:decimal

# Check that it created a file in app/models/product.rb and a migration file. in db/migrate/

# Run rails db:migrate  to set up the database tables

# Check your db/schema.rb to make sure it has the proper fields and that your products table was created

# within rails console 

# my-api(dev)> Product.create(name: "computer", price: 1400)
#   TRANSACTION (0.5ms)  BEGIN /*application='MyApi'*/
#   Product Create (34.3ms)  INSERT INTO "products" ("name", "price", "created_at", "updated_at") VALUES ('computer', 1400.0, '2025-02-17 10:39:31.180252', '2025-02-17 10:39:31.180252') RETURNING "id" /*application='MyApi'*/
#   TRANSACTION (0.6ms)  COMMIT /*application='MyApi'*/
#       => 
#       #<Product:0x000000010d232450
#       id: 1,
#       name: "computer",
#       price: 0.14e4,
#       created_at: "2025-02-17 10:39:31.180252000 +0000",
#       updated_at: "2025-02-17 10:39:31.180252000 +0000">
#       my-api(dev)> Product.create(name: "tablet", price: 900)


#         TRANSACTION (0.2ms)  BEGIN /*application='MyApi'*/
#         Product Create (2.9ms)  INSERT INTO "products" ("name", "price", "created_at", "updated_at") VALUES ('tablet', 900.0, '2025-02-17 10:40:11.197450', '2025-02-17 10:40:11.197450') RETURNING "id" /*application='MyApi'*/
#         TRANSACTION (0.9ms)  COMMIT /*application='MyApi'*/
#       => 
#       #<Product:0x000000010d23cf90
#       id: 2,
#       name: "tablet",
#       price: 0.9e3,
#       created_at: "2025-02-17 10:40:11.197450000 +0000",
#       updated_at: "2025-02-17 10:40:11.197450000 +0000">

#         id: 3,
#         name: "Macbook Air",
#         price: 0.19e4,
#         created_at: "2025-02-17 10:43:45.433114000 +0000",
#         updated_at: "2025-02-17 10:43:45.433114000 +0000">]


# How to change variable.name?
#     computer.name = "Windows"

# How to delete a product?
#     Product.delete(ID#)

#-----------------------------------------------------------------

# class ProductsController < ApplicationController
#   def index
#     products = Product.all
#     render json: products
#   end

#   def create
#     product = Product.create(name: "phone", price: 50)
#     render json: product
#   end
# end

# Rails.application.routes.draw do
#   get '/products' => 'products#index'
          #purpose is to route it to the index controller
#   post '/products' => 'products#create'

#   get '/students' => 'students#index'
# end

# httpie 
  #http://localhost:3000/products

#--------------------------------------------------------------

Create another API/database

# Create the Product model by running 
#   rails generate model Product name:string price:decimal

# Check that it created a file \in app/models/product.rb and a migration file. in db/migrate/

# Run rails db:migrate  to set up the database tables

# Check your db/schema.rb to make sure it has the proper fields and that your products table was created

# within rails console 

CRUDE ROUTES TO CREATE 
- index 
- create
- show 
- destroy 

#------------------------------------------------------------------------

# --------------------- WEEK 5.2 - DAY  22 -------------------------------

# Question of the Day: Comfort food?
    #BEEF SHANK

#Hotkey of the day: Cmd-TAB (don't hold down) - swithc through applications
#-----------------------------------------------------------------
The rough steps are:
Set up the route to point to the controller method of your choice
Create the controller
Create the method in the controller
Create the model
Use rails console to interact with the database and create objects based on the model you created
Optionally use the controller and create the 'index', 'show', 'create', 'update', and 'destroy' routes so that way you don't have to use rails console and can instead use HTTPie to make requests to do one of those actions
Hint - Look at the images for how to set up the routes and what type of request it is
Hint - if you're ever not sure if you need to run rails db:migrate - check your schema.rb to see if the new table or changes you've made to your database model are there

1. GET
Typically used for Read operations.
When you perform a GET request to a particular endpoint (e.g. GET /products), you’re telling the server: “Send me the data you have about these products.”
No data is typically sent to the server to change anything in the database; it’s purely a retrieval operation.

2. POST
Typically used for Create operations.
When you make a POST request (e.g. POST /products), you’re sending new data (like { name: "New Product", price: 9.99 }) for the server to save in its database.
The server processes that data and creates a new record.

3. PUT or PATCH
Typically used for Update operations.
Both PUT and PATCH modify existing resources, but the common convention is that PUT replaces the entire record, whereas PATCH partially updates only certain fields.
In many real-world APIs (including Rails), PATCH is used more frequently for updating resources because you only send the fields you want to update.
Example: PATCH /products/1 to update the product with id=1 using a JSON body like { price: 11.99 }.

4. DELETE
Used for Delete operations.
A DELETE request to (e.g. DELETE /products/1) instructs the server to remove the record with id=1 from the database.
The server typically responds with either a success status (like 204 No Content) or an error if something went wrong (e.g. product not found).

#---------------------------------------------------------------------------
#def index
#def show
#def create
#def update
#def destroy

EXAMPLE

class StudentsController < ApplicationController
  def index
    students = Student.all
    render json: students
  end

  def show
    student = Student.find(2)
    render json: student
  end

  def create
    student = Student.create(name: "student", grade: 12, gpa: 3.90)
    render json: student
  end

  def update
    student = student.find(2)
    student.update(
      name: "Jessica Fernandez",
      grade: 18,
      gpa: 3.90
    )
  end

  def destroy
    student = Student.find(2)
    student.destroy
    student = Student.all
    render :no_content
  end
end
#-------------------------------------------------------------------------

#Making the API dynamic 

Static:
     student = Student.find(2)

Dynamic:
    student = Student.find(params[:id])

    SHOW:
      http://localhost:3000/students/2
      Would show the student with id#2

    DELETE:
    Click the Get (HTTPie) and press delete then 
    http://localhost:3000/students/2

    POST:
    just click what you want to update
    BUT HAS TO MATCH SCHEMA AND CONTROLLER

CONTROLLER

class ProductsController < ApplicationController
  # STATIC
  # def index
  #   products = Product.all
  #   render json: products
  # end

  # def show
  #   product = Product.find(2)
  #   render json: product
  # end

  # def create
  #   product = Product.create(name: "phone", price: 50)
  #   render json: product
  # end

  # def update
  #   product = Product.find(2)
  #   product.update(
  #     name: "chicken",
  #     price: 10
  #   )
  #   render json: product
  # end

  # def destroy
  #   product = Product.find(2)
  #   product.destroy
  #   # product.delete(id#) DELETES
  #   product = Product.all
  #   render :no_content
  # end

  # DYNAMICdef index
  def index
    puts "Hello World"
    products = Product.all
    render json: products
  end
  def show
    product = Product.find(params[:id]) # dynamic for showing
    puts "==========="  # shows up in terminal
    puts params[:id]
    puts "==========="
    # product = Product.find(2)  #static function
    render json: product
  end
  def create
    product = Product.create(name: params[:name], price: params[:price]) # dynamic
    # product = Product.create(name: "phone", price: 50) #static
    render json: product
  end
  def update
    product = Product.find(params[:id])
    product.update(
      name: params[:name] || product.name,
      price: params[:price] || product.price
      )
    render json: product
  end
  def destroy
    product = Product.find(params[:id])
    product.destroy
    # products = Product.all
    render json: products
  end
end

ROUTES
# get '/products' => 'products#index'
# get '/products/:id' => 'products#show'
# post '/products' => 'products#create'
# patch '/products/:id' => 'products#update'
# delete '/products/:id' => 'products#destroy'

#-----------------------------------------------------------------------

MIGRATION!!!!!
Creating another model "teacher"

rails generate model Teacher first_name: string last_name:string
*ENTER*
    ALSO CAN
    rails generate model Teacher
    THEN go into the migration file and input the needed before migration
    t.string :first_name
    etc. 

NOT IN SCHEMA YET!

Doesn't exist yet! WHY????

DIDNT MIGRATE IT YET!!!!

Look at migration folder first and you can find your  folder there.
You can still edit the file ONLY if you did not migrate yet.

rails db:migrate
*ENTER*

BUT YOU CAN NO LONGER EDIT THE MIGRATE FILE ONCE MIGRATED. it WILL break. 

You need to add a migration in order to add more into the model Teacher. 

rails generate migration AddEmailToTeachers

Adding a column
class AddEmailToTeachers < ActiveRecord::Migration[8.0]
  def change
    add_column :teachers, :email, :string
  end
end

Another migrate file should show up in the migrate files AND the schema should have been updated

Renaming a column (editing a column)
class ChangeEmailToPhoneNumber < ActiveRecord::Migration[8.0]
  def change
    rename_column :teachers, :email, :phone_number
  end
end

Syntax to change the datatype:
change_column :table_name, :column_name, :new_data_type

class ChangePhoneNumberTypeInTeachers < ActiveRecord::Migration[6.1]
  def change
    change_column :teachers, :phone_number, :integer
  end
end

AGAIN ONCE MIGRATED YOU CANNOT EDIT YOUR FILE!!!!!
#-------------------------------------------------------------------------------

------------------------Week 5.3 Day 23-----------------------------------

For tomorrow here's your instructions:
Think of some sort of object you want to create an API for (don't use the examples we've used today - products, students, teachers - make it something different).
Hats, Sports, Dogs, Cats, Cars, Subjects, Schools, Shoes, etc. - really it can be almost literally anything.
From there based on the object you're creating an api for you'll run the command to create an api, naming it your_object_api
For example - rails new hat_api --api --database=postgresql
Or rails new shoe_api --api --database=postgresql
Go into the app it made
ex. cd hat_api
Create the database
rails db:create
Migrate the database
rails db:migrate
Start the server to make sure everything is working
rails server
Create your first route (start with the index)
ex. get '/hats' => 'hats#index

Create the controller
ex. rails generate controller hats
Add your method that you need (ex. index) to that controller

Create your model
ex. rails generate model Hat color:string size:integer

Migrate the database after you create the model
rails db:migrate

Use rails console  to test creating that object, edit it, delete it, view it, etc.
Update your index method to show all of that specific object

def index
  hats = Hat.all
  render json: hats
end

Test your new index route in HTTPie to make sure it works
Create the rest of the CRUD routes (show, create, update, and destroy)
Recommendations:
Please do them one by one and test each individually rather than create all of them at once and then test it
Start with hardcoded data first and then once you get working, then update it to be dynamic and use the parameters we went over
Test each route individually, don't assume they're just working
Take your time
Repeat this entire process and create a brand new application with another object - ex. planes, motorcycles, etc.
Make sure you get out of that project before you create a new one! This new project needs to be it's own repository, you're not going to create it within an old repository or your other application.

#---------------------------------------5.4------------------------------------------------

Idea of migration:
  ex. if you have columns for first and last name but want to change to full name 
    (PSEUDO CODE)
    first_name
    last_name 

    rails generate migration ChangeFirstAndLastToFullName 

    delete first_name
    delete last_name 
    add full_name 

    rails db:migrate

#-----------------------------------------------------------------------------------------

VALIDATION:
ensures that entry is valid. 

either data value is 
  - present
  - case sensitive
  - number of characters is lesser or greater than 
  - positive price input 
          validates :price, numericality: { greater_than_or_equal_to: 0 }

Basically the parameters you're putting in place for the data to be inputted.

ex: password must be more than 7 characters and contain uppercase, lowercase, number, and special character.

iLike2eatApples!

Why Use Validations?
   - Data Integrity: Prevents nonsensical or incomplete data (e.g., "" for a product name) from ever being saved.
   - Better User Experience: Instead of cryptic database errors, the app can show human-friendly error messages (e.g., “Name can’t be blank”).
   - Security: Minimizes malicious or unexpected input (like extremely large numbers) being stored in your database.
   - Consistency: Everyone using the API has to meet the same criteria, resulting in uniform, high-quality data.

Common Validation Types (w/in models)

presence: true
  Ensures a field isn’t empty (nil or an empty string).
    Example: validates :title, presence: true
uniqueness: true
  Ensures no two records have the same value for a field.
    Commonly used for emails, usernames, etc.
    Example: validates :email, uniqueness: true
length: { minimum: X, maximum: Y }
  Enforces length constraints for strings.
    Example: validates :description, length: { minimum: 10 }
format: { with: /REGEX/ }
  Checks if a field matches a certain pattern.
    Example: validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
numericality: { only_integer: true, ... }
  Ensures a field is numeric. Additional options check if it’s positive, integer, etc.
    Example: validates :age, numericality: { only_integer: true, greater_than: 0 }
Custom Validations
  You can write a custom method in your model to perform more complex checks.
    Example: validate :price_must_be_sensible with a private method that sets errors.add(:price, "is too high") if some condition fails.

#-------------------------------------------------------------------------------------------

ASSOCIATIONS:
basically categorizes an object to another

WITHIN MODELS Folder
rails generate model Owner name:string
has_many :pets dependent: :destroy
      Jessica(Owner) has pets
      if Jessica is deleted then ALL categories under would be deleted

PETS
rails genereate model Pets name:string owner:reference
belongs_to :Jess (owner)
pets = [Moebeanz, Kaiju, Billy, Boboi] belongs to Jessica

Question:
What if post migrate you wanted Owner to BELONG TO ex: Vet_clients

ans: many to many
Join table - that basically would join one object group to another object group "directly"

owner_id
pets_id

#---------------------------------------------
t.bigint - store more numbers to be more accurate 
      ex: banking system 
"In general, the main difference between using bigint (64-bit integer) and int (commonly a 32-bit integer) is the range of values each can hold:
  - int (32-bit) can store values up to about 2 billion (2^31−1 for signed integers).

  - bigint (64-bit) can store values up to about 9 * 10^18 (2^63−1 for signed integers).""



MAKE CHEAt SHEEt 
- file name has to have name_Controller "_" must be present

amc = Vet.create(name: "Animal Medical Center")
jfernandez = Clients.create(name: "Jessica Fernandez")
FAILED why???
bc you made it mandatory that it belongs to Vet 
            Model
            class Client < ApplicationRecord
              belongs_to :vet
              has_many :pet
            end

            Can make it optional by: 
            belongs_to :user, optional: true


jfernandez = Client.create!(name: "Jessica Fernandez", vet_id: 1)

REMINDER: NEVER TOUCH SCHEMA OR MIGRATE(specifically after successful migration)

has_many :clients #make sure it is plural

amc = Vet.find(1) variables delete after every reset

          when creating associations 
            create main 
              migrate
            create second 
              migrate
            form association
              test
            then create third

#----------------------------------------------------------------------------------------
#week 5.5 - 
#Question:
  - How do you like your spam? Thin and crispy?? Thick???
    #THIN AF 

#Hot key: rails g = rails generate

#---------------------------------EXERCISE -----------------------------------

Rails API Exercise
Create a New Rails API App (PostgreSQL)
From your terminal, create a new Rails project in API mode and specify PostgreSQL as the database.

rails new <app_name> --api --database=postgresql 

Navigate into the new project folder.
cd <app_name>
Configure Your Database
Ensure the config/database.yml is set up for PostgreSQL.
Run the command to create your development database.
rails db:create
rails db:migrate
Plan and Create Two Models
Decide on two entities that have a one-to-many relationship (e.g. Author → Book, Category → Product, etc.).
Generate the first model (the “parent”), including at least one attribute (e.g., name).
Generate the second model (the “child”) with references to the first (e.g., author:references).
Run your migrations so the tables appear in your database.
rails generate model Author name:string
Add Validations and Associations
In each model file, add validations to ensure required fields aren’t empty (e.g. presence: true) or any other constraints you need (e.g. numericality).
Remember to declare the one-to-many relationship using belongs_to in the child model and has_many in the parent model and remember that the model with the belongs_to has the foreign key (id from the parent model/table).
Check in the Rails Console
Launch the console.
Create a parent record and then a child record that references it.
Test that validations work by trying to create invalid records (missing required fields, etc.).
Set Up Controllers and Routes
Create controllers for each resource (e.g., AuthorsController, BooksController), each with the standard CRUD actions (index, show, create, update, destroy).
rails generate controller authors
In config/routes.rb, define RESTful routes. You may use the resources shortcut for each model or explicitly write out each route.
Test CRUD with HTTPie
List all items in a resource.
Create new records, providing the necessary data in JSON format.
Show a specific record by its ID.
Update that record (and confirm validations if you try invalid updates).
Delete the record.
Observe how the database changes or returns errors for invalid data.
Verify Validations
Try sending invalid data via HTTPie (e.g., missing a required field).
Confirm the server responds with errors (like a 422 status).
Bonus/Optional
Add additional validation rules (e.g. uniqueness, minimum length).
Experiment with how deleting the parent affects child records (e.g., dependent: :destroy).
(edited)
#-----------------------------------------


To add references post migrate
class ReferWorkoutToPhysHealth < ActiveRecord::Migration[8.0]
  def change
    add_column :workouts, :physical_health_id, :integer, null: false
    #FUNCTIONS :location, :added column, :type, validation
  end
end

easier to create if you lay out your schema through excel, notes, etc. 
ex:
  physicalHealth
    Workout
      Exercise

ROUTES
get "/physhlths" => "physicalhealths#index"
    can be anything =>  HAS TO BE THE CONTROLLER NAME

Same with this 
def index
  physhlths = PhysicalHealth.all # model.all
  render json: physhlths
end