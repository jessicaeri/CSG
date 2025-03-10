# --------------------- WEEK 7.1 - DAY  31 -------------------------------

# WAS ABSENT!!!!!

### **Introduction**

**What is Authentication?**

Authentication is the process of verifying who a user is. It ensures that only authorized users can access certain parts of your application.

**What is a Rails API?**

Rails is a web application framework written in Ruby. A Rails API is a backend application that provides data to frontend applications or clients.

### **Prerequisites**

- Basic knowledge of Ruby and Rails.
- A Rails API application set up.

### **Step 1: Add Necessary Gems**

1. **Open Your Gemfile**

   - Located in the root directory of your Rails project.

2. **Add the Following Gems**

   ```ruby
   gem 'bcrypt', '~> 3.1.7' # For hashing passwords securely
   gem 'jwt', '~> 2.2'      # For generating JSON Web Tokens
   ```

3. **Install the Gems**

   ```bash
   bundle install
   ```

### **Step 2: Generate a User Model**

1. **Create the User Model**

   ```bash
   rails generate model User name:string email:string password_digest:string
   ```

2. **Migrate the Database**

   ```bash
   rails db:migrate
   ```

### **Step 3: Set Up User Authentication**

1. **Modify the User Model**

   - Open `app/models/user.rb`.
   - Add:

     ```ruby
     class User < ApplicationRecord
       has_secure_password
       validates :email, presence: true, uniqueness: true
     end
     ```

   - **Explanation**:
     - `has_secure_password` adds methods to set and authenticate passwords.
     - Validates that email is present and unique.

### **Step 4: Create Users Controller**

1. **Generate the Controller**

   ```bash
   rails generate controller Users
   ```

2. **Implement the Create Action**

   - Open `app/controllers/users_controller.rb`.
   - Add:
   #User.create but remove user.save
     ```ruby
     class UsersController < ApplicationController
       def create #can be 
         user = User.new(
           name: params[:name],
           email: params[:email],
           password: params[:password],
           password_confirmation: params[:password_confirmation]
         )
         if user.save
           render json: { message: 'User created successfully' }, status: :created
         else
           render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
         end
       end
     end
     ```

### **Step 5: Set Up Routes**

- Open `config/routes.rb`.
- Add:

  ```ruby
  post '/signup', to: 'users#create'
  ```

### **Step 6: Implement Login Functionality**

1. **Generate Sessions Controller**

   ```bash
   rails generate controller Sessions
   ```

2. **Implement the Create Action**

   - Open `app/controllers/sessions_controller.rb`.
   - Add:

     ```ruby
     class SessionsController < ApplicationController
       def create
         user = User.find_by(email: params[:email])
         if user && user.authenticate(params[:password])
           token = JWT.encode({ user_id: user.id }, Rails.application.credentials.secret_key_base)
           render json: { jwt: token, user: user }, status: :created
         else
           render json: { error: 'Invalid email or password' }, status: :unauthorized
         end
       end
     end
     ```

   - **Explanation**:
     - Finds the user by email.
     - Authenticates the password.
     - Generates a JWT token if authentication is successful.

### **Step 7: Update Routes for Login**

- In `config/routes.rb`, add:

  ```ruby
  post '/login', to: 'sessions#create'
  ```

### **Step 8: Protecting Routes with Authentication**

1. **Implement the Current User Method**

   - Open `app/controllers/application_controller.rb`.
   - Add:

     ```ruby
     class ApplicationController < ActionController::API
       def authorize_request
         header = request.headers['Authorization']
         token = header.split(' ').last if header
         begin
           decoded = JWT.decode(token, Rails.application.credentials.secret_key_base)[0]
           @current_user = User.find(decoded['user_id'])
         rescue ActiveRecord::RecordNotFound, JWT::DecodeError
           render json: { errors: 'Unauthorized' }, status: :unauthorized
         end
       end

       def current_user
         @current_user
       end
     end
     ```

2. **Protect Controller Actions**

   - In any controller you want to protect, add:

     ```ruby
     before_action :authorize_request
     ```

### **Step 9: Test the Authentication Flow**

1. **Signup**

   - Use a tool like Postman to send a POST request to `http://localhost:3000/signup` with body parameters:

     ```json
     {
       "name": "John Doe",
       "email": "john@example.com",
       "password": "password123",
       "password_confirmation": "password123"
     }
     ```

2. **Login**

   - Send a POST request to `http://localhost:3000/login` with body parameters:

     ```json
     {
       "email": "john@example.com",
       "password": "password123"
     }
     ```

   - You'll receive a JWT token in the response.

3. **Access Protected Routes**

   - Include the JWT token in the `Authorization` header of your requests:

     ```
     Authorization: Bearer your_jwt_token
     ```

### **Conclusion**

You've set up user authentication in your Rails API using JWTs. This allows users to securely sign up, log in, and access protected resources.

---

#-----------------------------------------------------------------
# --------------------- WEEK 7.2 - DAY  32 -------------------------------

# Question of the Day: What is your dream job if you have no responsibilities?

#Hotkey of the day: 
#-----------------------------------------------------------------
terminal:
rails g migration AddRoleToUsers

add_column :users, :role, :string, default: 'user'

gemfile:
gem 'pundit' # to help setup roles

terminal:
bundal install

application_controller.rb:
include Pundit
# Rescue from Pundit errors
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

private

def user_not_authorized
  render json: { error: 'You are not authorized to perform this action.'}, status: :forbidden
end

user.rb (user model):
  validates :role, inclusion: { in: %w[user admin], message: "%{value} is not a valid role" }

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end

Pundit Policies
Pundit helps centralize all your authorization rules in dedicated “policy” files.
Instead of scattering if-else checks throughout your controllers, you define what each role can or cannot do in a clear, structured way.


rails generate pundit:install

class ProductPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user.admin? 
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  attr_reader :user, :product

  def initialize(user, product)
    @user = user
    @product = product
  end

  def index?
    true
  end

  def show?
    product.published? || user.admin
  end
end

Scope Class:
  resolve determines which set of Products a user sees when calling policy_scope(Product).
  Admin → see everything.
  Regular user → see only certain records (e.g., published or priced above a threshold).
Record-Level Methods (show?, create?, update?, destroy?):
  show?: This checks if a user can view one particular product. For example, maybe only published products are visible to regular users, but admins can see everything.
  create?: Ensures only logged-in (i.e., user.present?) users can create a product.
  update?/destroy?: A typical pattern is: a user can only update or delete their own products or be an admin.

LEON WALKTHROUGH SLACK CODE:
Pundit Setup & Authorization Walkthrough
1. Overview
  In this guide, we’ll:
    1. Add the Pundit gem to our Rails application.
    2. Configure Pundit in the ApplicationController.
    3. Define user roles (e.g., user or admin) in the User model.
    4. Generate a Pundit policy (for a resource like Product).
    5. Apply policy checks in a controller (ProductsController).
    6. Wrap up with an exercise to reinforce these steps.
  We assume you already have:
    - A Rails API application with a User model (e.g., a user has a role attribute).
    - Basic JWT authentication or some form of user authentication in place (so current_user is available).               
2. Setting Up Pundit
Gem Installation
Add Pundit to your Gemfile:
# Gemfile
gem 'pundit'
Install the gem
bundle install
Include Pundit in
ApplicationController
# app/controllers/application_controller.rb

class ApplicationController < ActionController::API
  include Pundit  # 1. Include Pundit to gain access to its methods

  # 2. Rescue from unauthorized attempts
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden
  end
end
3. Defining User Roles & Policies
3.1 Update the User Model
# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  # Enforce valid roles
  validates :role, inclusion: { in: %w[user admin], message: "%{value} is not a valid role" }

  def admin?
    role == 'admin'
  end

  def user?
    role == 'user'
  end
end
3.2 Generate a Pundit Policy for a Model
Install the default Pundit structure (if you haven’t already):
rails generate pundit:install
This creates app/policies/application_policy.rb.
Generate a policy for a resource (e.g. Product):
rails generate pundit:policy Product
Creates app/policies/product_policy.rb.
3.3 Define Permissions in ProductPolicy
# app/policies/product_policy.rb

class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # Collection-level authorization (which Products can a user see?)
    def resolve
      if user.admin?
        scope.all
      else
        # Example logic: regular users see only products over a certain price
        scope.where('price > ?', 500)
      end
    end
  end

  attr_reader :user, :product

  def initialize(user, product)
    @user    = user
    @product = product
  end

  # Record-level methods:

  def index?
    true  # Typically, product listings are public
  end

  def show?
    product.published? || user.admin?
  end

  def create?
    user.present?
  end

  def update?
    user.present? && (product.user_id == user.id || user.admin?)
  end

  def destroy?
    user.present? && (product.user_id == user.id || user.admin?)
  end
end
Scope Class
: Defines who can see what when we call policy_scope(Product).
Record-Level Methods: show?, create?, update?, destroy? check if the user is allowed to do the action on one product.
Why This Matters
Centralized Logic: Policies hold all the “who can do what” rules, rather than scattering them in controllers.
Scalability: If you add roles like “moderator,” you can easily update these policy methods.
Real-World Use: Many apps require different levels of access (owner, admin, user, etc.).
4. Applying Policies in the Controller
4.1 Example: ProductsController
# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = policy_scope(Product)  # => runs ProductPolicy::Scope#resolve
    render json: @products
  end

  # GET /products/:id
  def show
    authorize @product  # => calls show? in ProductPolicy
    render json: @product
  end

  # POST /products
  def create
    @product = current_user.products.build(product_params)
    authorize @product   # => calls create? in ProductPolicy

    if @product.save
      render json: @product, status: :created
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/:id
  def update
    authorize @product   # => calls update? in ProductPolicy

    if @product.update(product_params)
      render json: @product
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    authorize @product   # => calls destroy? in ProductPolicy
    @product.destroy
    render json: { message: 'Product deleted' }, status: :ok
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :content, :price, :published)
  end
end
4.2 Key Points
policy_scope(Product): Returns only the products the current user is allowed to see (Scope#resolve).
authorize @product: Checks if the current user can perform the requested action (e.g., update?).
Error Handling: If the user isn’t authorized, Pundit raises NotAuthorizedError, which we rescue in ApplicationController.
Pitfalls & Tips
Forgetting authorize @product
If you don’t call it, you might inadvertently allow unauthorized actions.
Using the Wrong Variable
Make sure you’re calling authorize @product, not authorize product_params.
Testing with Different Roles
Confirm an admin can do everything, a user can only do actions on their own resources, etc.
5. Exercise: Build & Extend
Objective: Practice implementing your own policy from scratch.
Create a New Model (e.g., Post, Comment, or any resource relevant to your app).
Add a Controller for that model with standard CRUD actions (index, show, create, update, destroy).
Generate a Policy:
rails generate pundit:policy Post
In post_policy.rb, define:
A Scope#resolve method controlling what posts each role can see.
Methods for each action (index?, show?, create?, update?, destroy?).
Integrate in the Controller:
In your PostsController, call policy_scope(Post) in index to filter the collection.
For actions like update, destroy, or any custom action, call authorize @post.
Test:
Create multiple users (regular user, admin) in your database.
Try performing CRUD actions in Postman or curl:
See if an admin can do everything.
See if a user can only edit/delete their own posts.
Check that a user is blocked from editing another user’s post (403 Forbidden).
Optional Challenge:
Add an extra role (like “moderator”).
Provide a specialized scope or partial permissions for that role.
Success Criteria:
You can see unauthorized attempts returning a 403 response.
Proper logs or testing confirm only the correct roles can perform each action.


if you want a method to return true or false its good to put a "?" at the end (e.g. show?)

# --------------------- WEEK 7.4 - DAY  33 -------------------------------

# Question of the Day: What is your dream job if you have no responsibilities?

#Hotkey of the day: 
#-----------------------------------------------------------------

VERSIONING:

Decide on a resource to build (e.g., Users, Posts, etc.).

In config/routes.rb, create your namespaced routes:
  namespace :api do
    namespace :v1 do
      resources :users
      # or resources :posts, etc.
    end
  end

Generate a namespaced controller:
  rails generate controller api/v1/users

Ensure it’s placed in app/controllers/api/v1/.

Update the new controller to respond with simple JSON (e.g., a UsersController#index method).
Test the routes with Postman or cURL at /api/v1/users.

(Option B) Update an Existing Rails Application
    Pick an existing Rails project that responds with JSON.
    Add the api/v1 structure in config/routes.rb:
   
    namespace :api do
      namespace :v1 do
      # Move or recreate your existing routes here
      end
    end

Create directories for namespaced controllers:
    mkdir -p app/controllers/api/v1
      #put all the controllers you'd want that would have different versions
    #main (e.g. user) controller functions shouldn't be in the api/v#
      #technically can have user but routes.rb would need to be within the controller 
    #can have same exact controller names within different namespace 
        #ex v1/team_controller
        #ex v2/team_controller


Move or copy your existing controllers into app/controllers/api/v1/ and update their module definitions accordingly:
    module Api
      module V1
        class UsersController < ApplicationController
          # existing actions...
        end
      end
    end

Refactor references – anywhere you used the old controllers or routes, update them to point to the new api/v1 version.

Test all your endpoints to confirm they now work at URLs like /api/v1/users.

(Optional) Introduce a Second Version, v2 
Create another namespace under api:
    namespace :api do
      namespace :v1 do
        resources :users
      end

      namespace :v2 do
        resources :users
      end
    end

Copy your v1 controllers into a v2 folder, then make some changes (e.g., returning extra JSON fields).
Confirm you can still access old endpoints at /api/v1/... while new ones exist at /api/v2/....

Exercise Deliverables
    Namespaced routes for /api/v1/....

    A controller inside app/controllers/api/v1/ that successfully returns JSON data.
    
    (Optional) A second version under v2 that shows at least one difference from v1.
    
    Screenshot or short demonstration of you calling these endpoints via Postman/cURL to prove everything is functional.
Additional Notes / Hints
    For a brand-new project, remember to commit your initial codebase, then commit again after adding namespaces.
    
    If you are moving a large existing app into namespaces, do it gradually – route by route, controller by controller, testing each step.

For debugging, run:
rails routes
to ensure your routes are correctly set up.
Check for naming conflicts or mis-matched module definitions, e.g. module Api::V1 in the file while it’s physically placed in app/controllers/api/v2.

# --------------------- WEEK 7.4 - DAY  33 -------------------------------

# Question of the Day: Would you be a severed employee???
YESSSS

#Hotkey of the day: 
#-----------------------------------------------------------------

Resources:
Does all of the code routes for you...
Unless you wanted a very specific route then youd have to explicitly  write it out

routes.rb
resources :controller name, only : [:name of method, etc.] 
                            except : [:name of method, etc.]

#allows routes to nest 
      localhost:3000/teachers/1/students
resources :teacher do 
  resources :students do 
end 

resources :teacher do 
  collection do 

  end 

  member do 
    get :something_cool
  end 
end 

For non-CRUD resources routes
   - Member = one item → :id in the path.
   - Collection = all items → no :id.

Pundit: https://github.com/CodeSchoolOfGuam-PilotClass/Resources/blob/main/AUTHENTICATION/guide_implementing_roles_with_pundit.md
Authentication: https://github.com/CodeSchoolOfGuam-PilotClass/Resources/blob/main/AUTHENTICATION/guide_implementing_rails_authentication.md

Token expiration?


initializers/filter parameters
  controls what we can and cannot see within in general (rails c, rails s, everywhere)

