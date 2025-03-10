#based on my notes from week 4 to week 7... Used ChatGPT to ATTEMPT to create comprehensive guide 

# Ruby on Rails API Creation Cheat Sheet

## Basic Concepts

# API (Application Programming Interface)
# An API allows different software applications to communicate with each other over the internet to fetch or send data.

---

## Fetching Data from API

require 'net/http'  # For making HTTP requests
require 'json'      # For parsing JSON responses

# Define the API URL you want to fetch data from
url = URI("https://jsonplaceholder.typicode.com/posts/1")

# Send a GET request to fetch data from the specified URL
response = Net::HTTP.get(url)  

# Parse the JSON response into a Ruby hash for easier data manipulation
data = JSON.parse(response)  

# Output specific fields from the parsed data
puts "Title: #{data['title']}"  
puts "Body: #{data['body']}"

---

## Making HTTP Requests

# Constructing a Simple API Request
# 1. Pick an Endpoint: e.g., https://jsonplaceholder.typicode.com/posts/1
# 2. Create a Ruby File: Name it api_demo.rb and include:

require 'net/http'  # For making HTTP requests
require 'json'      # For parsing JSON responses

# Define the URL of the API endpoint
url = URI("https://jsonplaceholder.typicode.com/posts/1")

# Fetch data from the API
response = Net::HTTP.get(url)

# Parse the JSON response into a Ruby hash
data = JSON.parse(response)

# Output specific fields from the data
puts "Title: #{data['title']}"
puts "Body: #{data['body']}"

# 3. Running the File: 
# Execute `ruby api_demo.rb` in the terminal to see the output.

---

## Setting Up a Ruby on Rails API Application

# Creating a New Rails API
1. Install Rails if you haven’t:
   gem install rails  # Ensure Rails is available for creating applications

2. Create a new Rails API application:
   rails new my_api --api --database=postgresql
   # Creates a new Rails project in API mode using PostgreSQL as the database. The `--api` flag sets it up as an API-only application.

3. Navigate to the app directory:
   cd my_api  # Change to the project directory

4. Create the database:
   rails db:create  # Sets up the database specified in the configurations
   rails db:migrate  # Applies migrations to set up the database schema

5. Start the server:
   rails server  # Launches the Rails development server

# Access the API at: http://localhost:3000.

---

## Routing in Rails

# Adding Routes
# Open config/routes.rb to define your routes.

Rails.application.routes.draw do
  get '/products' => 'products#index'  # Maps GET request to the index action of ProductsController
  post '/products' => 'products#create' # Maps POST request to the create action of ProductsController
end

# Explanation:
# `get '/products'` allows clients to retrieve a list of products.
# `post '/products'` allows clients to create a new product in the database.

---

## Creating a Controller

# Generate a Products Controller
rails generate controller Products  # Creates a new controller for managing Products

# Add Actions in Products Controller
class ProductsController < ApplicationController
  def index
    products = Product.all  # Fetches all products from the database
    render json: products  # Renders the products as JSON for the client
  end

  def create
    product = Product.create(product_params)  # Creates a new product using strong parameters
    render json: product  # Returns the created product as JSON
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)  # Strong parameters to prevent mass assignment vulnerabilities
  end
end

---

## Creating a Model

# Generate a Product Model
rails generate model Product name:string price:decimal  # Creates a database model for products

# Migrate the Database
rails db:migrate  # Applies created migrations to the database

---

## Validations

# Adding Validations to the Model
class Product < ApplicationRecord
  validates :name, presence: true  # Ensures name is provided; cannot be empty
  validates :price, numericality: { greater_than_or_equal_to: 0 }  # Ensures price is non-negative
end

---

## CRUD Actions

# Typical CRUD Routes
In your routes.rb, set up routes for CRUD actions.

resources :products  # Creates all CRUD routes (index, show, create, update, destroy)

# Standard Actions in Controller
def show
  product = Product.find(params[:id])  # Finds a specific product by ID
  render json: product  # Renders the found product as JSON
end

def update
  product = Product.find(params[:id])  # Finds the product to update by ID
  product.update(product_params)  # Updates product attributes based on provided parameters
  render json: product  # Renders the updated product as JSON
end

def destroy
  product = Product.find(params[:id])  # Finds the product to delete by ID
  product.destroy  # Deletes the product from the database
  head :no_content  # Sends a no content status indicating success
end

---

## Testing with HTTPie

# Make Requests
# Use HTTPie for testing your API.

# Install HTTPie (if not already installed):
# For macOS, use Homebrew:
# brew install httpie

# Make GET and POST Requests:
# GET Request: Fetch all products.
http GET http://localhost:3000/products

# POST Request: Create a new product with required JSON body parameters.
http POST http://localhost:3000/products name="New Product" price=99.99

# PUT/PATCH Request: Update an existing product (e.g., with ID 1).
http PATCH http://localhost:3000/products/1 name="Updated Product" price=79.99

# DELETE Request: Remove a product by ID.
http DELETE http://localhost:3000/products/1

---

## Using Serializers

# Adding Active Model Serializers

1. Add to Gemfile:
   gem 'active_model_serializers'  # Allows custom serialization for APIs

2. Install the Gem:
   bundle install  # Installs the added gem

3. Generate a Serializer:
   rails generate serializer Product  # Creates a serializer for the Product model

4. Modify Serializer:
   class ProductSerializer < ActiveModel::Serializer
     attributes :id, :name, :price  # Define what fields to serialize and expose
   end

---

## Versioning the API

# Creating Versioned Routes

#1. Define Namespaced Routes:
  In config/routes.rb, set up versioning:
   ````ruby
   namespace :api do
     namespace :v1 do
       resources :products  # Establishes routes under /api/v1/products
     end
   end 

#2.  Generate a Controller in Versioned Namespace
# This command generates a ProductsController under the v1 namespace.
rails generate controller api/v1/products 

#3.  Update Controller for Namespaced Structure
# Open the generated controller file at app/controllers/api/v1/products_controller.rb:
module Api
  module V1
    class ProductsController < ApplicationController
      def index
        products = Product.all  # Fetches all products from the database
        render json: products  # Returns the products as JSON for client consumption
      end
      
      # Other actions (show, create, update, destroy) can also be defined here
    end
  end
end

#---------------------
# Testing Versioned API Endpoints
# Access your API at:
# For version 1:
http GET http://localhost:3000/api/v1/products  # Tests the v1 products endpoint by sending a GET request

---

# Authentication with JWT

# Setting Up User Authentication

#1. Add Necessary Gems for Authentication
# Add these gems to your Gemfile for secure password handling and JWT generation:
gem 'bcrypt', '~> 3.1.7'  # For secure password hashing
gem 'jwt', '~> 2.2'       # For generating JSON Web Tokens (JWT)

#2. Install Gems
# After adding the gems, run the following command to install them:
bundle install  # Installs the necessary gems for authentication

#3. Create User Model
# Generate a User model with fields for name, email, and password_digest.
rails generate model User name:string email:string password_digest:string

#4. Migrate the Database
# Apply the migration for the newly created User model to set up the database schema.
rails db:migrate  

#5. Modify User Model
# Open app/models/user.rb and add the following code:
class User < ApplicationRecord
  has_secure_password  # Adds methods for securely handling user passwords
  validates :email, presence: true, uniqueness: true  # Validates the presence and uniqueness of email
end

#6. Create UsersController for Sign Up and Login
# Implement user registration and authentication in the UsersController:
class UsersController < ApplicationController
  def create
    user = User.new(user_params)  # Initializes a new user with the provided parameters
    if user.save  # Attempts to save the user in the database
      render json: { message: 'User created successfully' }, status: :created  # Returns a success message
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity  # Returns validation error messages
    end
  end

  def login
    user = User.find_by(email: params[:email])  # Finds the user by email
    if user&.authenticate(params[:password])  # Checks if the user exists and verifies the password
      token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base)  # Generates a JWT token for the authenticated user
      render json: { token: token }  # Returns the JWT token in the response
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized  # Returns error if authentication fails
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)  # Strong parameters to ensure only allowed attributes are passed
  end
end

#7. Testing User Authentication
# After setting up the UsersController, you can test the sign-up and login functionalities.
# For sign up, send a request with the user's name, email, and password.
# For login, send a request with the user's email and password.

  # Example Sign Up Request:
  # http POST http://localhost:3000/signup name="John Doe" email="john@example.com" password="securepassword"

  # Example Login Request:
  # http POST http://localhost:3000/login email="john@example.com" password="securepassword"

# -----------------------

# Error Handling
# Implement error handling in your controllers to gracefully manage exceptions.
# Example for handling ActiveRecord errors in a controller:
class ProductsController < ApplicationController
  def create
    product = Product.new(product_params)
    if product.save
      render json: product, status: :created  # Returns the created product
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity  # Validation error messages
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error  # Handles unforeseen errors
  end
end

# Using Pundit for Authorization
# After setting up user roles, use Pundit to manage access control.

# Include Pundit in ApplicationController
class ApplicationController < ActionController::API
  include Pundit  # Enables Pundit methods in all controllers
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized  # Handles unauthorized access
  
  private
  
  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden  # Returns forbidden error for unauthorized actions
  end
end

# Example ProductPolicy with Authorization Logic
class ProductPolicy < ApplicationPolicy
  def index?
    true  # Everyone can view products
  end

  def show?
    user.present?  # Only authenticated users can view a specific product
  end

  def create?
    user.present? && user.admin?  # Only admin users can create a product
  end

  def update?
    user.present? && (record.user_id == user.id || user.admin?)  # Users can update their own products or if they're admins
  end

  def destroy?
    user.present? && (record.user_id == user.id || user.admin?)  # Users can delete their own products or if they're admins
  end
end

# Implementing Authorization in Controller Actions
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]
  before_action :authorize_product, except: [:index]

  def index
    @products = policy_scope(Product)  # Uses Pundit's `policy_scope` method to scope the product list
    render json: @products  # Returns the product list
  end

  def show
    authorize @product  # Authorizes the action
    render json: @product  # Returns the specific product
  end

  def update
    authorize @product  # Authorizes the update action
    if @product.update(product_params)
      render json: @product  # Returns the updated product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @product  # Authorizes the destroy action
    @product.destroy  # Deletes the product
    head :no_content  # Sends a no content response
  end

  private

  def set_product
    @product = Product.find(params[:id])  # Finds the product by ID
  end

  def authorize_product
    authorize @product  # Uses Pundit's authorization checks
  end
end

# Testing API Endpoints
# You can use RSpec or Postman for testing your API endpoints.

# RSpec Example Test for Products
require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it "returns a list of products" do
      create(:product)  # Use FactoryBot to create a product for testing
      get '/api/v1/products'  # Sends GET request to products endpoint
      expect(response).to have_http_status(:success)  # Asserts the response status is successful
      expect(JSON.parse(response.body).size).to eq(1  # Asserts the response body contains one product
    end
  end

  # Additional tests for other actions (POST, PUT, DELETE) can also be added here.
end

# Final Notes for Development
# - Regularly commit your changes to version control (e.g., Git).
# - Use meaningful commit messages for better project tracking.
# - Consider setting up CI/CD tools for automated testing.
# - Explore API documentation standards (like OpenAPI) for documenting your API.