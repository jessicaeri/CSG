# --------------------- WEEK 6.1 - DAY  26 -------------------------------

# Question of the Day: What are your go to three items from a mom and pop store? Can be different items from different stores or general items.
# pocari sweat, empanada, pig in a blanket

#Hotkey of the day: ONLY IN TERMINAL - OPT slect where you'd want to edit with the cursor
#-----------------------------------------------------------------
Exercise:
Add a db/seeds.rb that creates 5 records of the model/s of your choice.
Run rails db:seed and see the error for the invalid user.
Fix the seeds to pass validations, or handle them with rescue.

use rails db:reset if anything 

Exercise:
Use Faker to update your application and create fake data
add faker to the gemfile (bottom of api file)
gem 'faker'

Terminal: Run bundle install

Add require 'faker' to the top of your seeds
Feel free to go through the Faker docs to see other options on different data you can create with Faker
https://github.com/faker-ruby/faker
(edited)
faker-ruby/faker
A library for generating fake data such as names, addresses, and phone numbers.
Stars
11317
Language
Ruby
Added by GitHub

Creates fake data that we can recreate anytime we want. 

#-----------------------------------------------------------------------
Many to Many associations 
1. has_and_belongs_to_many (HABTM)
Requires a simple join table with the 2 foreign keys (post_id, tag_id), but typically no primary key or additional columns.
Quick to set up, but less flexible if you need extra attributes on the relationship.

2. has_many :through
Uses a join model (e.g., PostTag) that belongs to both Post and Tag.
Recommended if you need extra fields (like added_on, tagger_id, etc.) or if you want to reference the relationship as a real entity.

JOIN TABLES (w/in schema)
  user
  groups
  membership 
    is referencing user AND groups 
  #ensure user and group ID created for memberships

rails g model User
rails db:migrate
rails g model Group
rails g db:migrate
rails g model Membership user:references group:references
rails db:migrate

#think braiding or 
# "Family concept"
#     ensure that the kid references the parents and parent references spouse and kid
group.rb (model - parent 1)
has_many :memberships
has_many :users, through :memberships

user.rb (model - parent 2)
has_many :memberships
has_many :groups, through :memberships

membership.rb (model - child)
belongs_to :user
belongs_to :group

seeds.rb 
user = User.create!(user: "JF")
group = Group.create!(group: "Ruby Enthusiasts")

memberships = Membership.create!(user: user, group: group)

#--------------------------------------------------------------
Validation to many to many 

rails g migration AddEmailToUser 
def change 
    add_column :users, :email, :string 
end

user.rb (model - parent 2)
has_many :memberships
has_many :groups, through :memberships

validates :name, presence: true

#hotkey - dails c = rails console

CUSTOM VALIDATION ----------
user.rb (model - parent 2)
has_many :memberships
has_many :groups, through :memberships

validates :name, presence: true
validate :email_domain_must_be_csg (any name)

  def email_domain_must_be_csg
    puts "---------------"
    puts "in the email domain must be csf method in the users controller"
    puts "---------------"
  end
  #basically this just shows it will pass when user is created

class User < ApplicationRecord
  has_many :memberships
  has_many :groups, through: :memberships

  validates :name, presence: true
  validate :email_domain_must_be_csg

  private #ensures that it is available only to backend

  def email_domain_must_be_csg
    return if email.blank?

    unless email.end_with?("@csg.com") #@company.com
      errors.add(:email, "must be a csg.com address")
    end
  end
end
#can function as anything we want depending how you want it.

Other examples:
class Order < ApplicationRecord
  validates :credit_card_number, presence: true, if: :paid_with_credit_card?

  private

  def paid_with_credit_card?
    payment_type == "credit_card"
    #if not true it the whole validation wont run
  end
end

#basically incorporating what we've learned in weeks 1 - 4 with methods. 
class Booking < ApplicationRecord
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end

def check_title_complexity
  if title.length < 10
    errors.add(:title, "is too short (min 10 chars)")
  end

  unless title.end_with?("?")
    errors.add(:title, "must end with a question mark")
  end
end

def title_must_be_clickbait
  clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
  return if title.blank?

  unless clickbait_phrases.any? { |phrase| title.include?(phrase) }
    errors.add(:title, "must be more clickbait-y! (missing key phrases)")
  end
end

#----------------------------------------------------------------
The Rails Callback Lifecycle
Common Callbacks in Order #look at convo with Leon for specific codes for each. Or use ChatGPT

1. before_validation
Fires before Rails runs the model’s validations.
Use cases: standardizing or cleaning data so that validations pass more easily.

2. after_validation
Fires after validations have run, but before saving.
Use case: you might check if any errors exist and do some quick logic (less common in practice).

3. before_save
Fires right before the record is saved to the database (whether it’s a create or an update).
Use cases: set default values, sanitize certain fields, run last-minute checks.

4. before_create and before_update
before_create only runs when a new record is about to be created (INSERT).
before_update only runs on existing records (UPDATE).
Use cases: generate a unique token upon creation, or log changes upon update.

5. after_create, after_update
Similar to the “before” versions, but happen after the record is successfully created or updated in the DB.
Use cases: sending a welcome email after_create, or logging a change feed after_update.

6. after_save
Runs after both create and update. Good for any “post-persist” logic that doesn’t care if it was newly created or just updated.

7. before_destroy, after_destroy
Fire before/after a record is removed from the database.
Use cases: do cleanup in other tables, or prevent destruction under certain conditions.

class User < ApplicationRecord
  has_many :memberships
  has_many :groups, through: :memberships

  validates :name, presence: true
  validate :email_domain_must_be_csg

  private #ensures that it is available only to backend

  def email_domain_must_be_csg
    puts "---------------"
    puts "in the email domain custom validation"
    puts "---------------"
    return if email.blank?

    unless email.end_with?("@csg.com") #@company.com
      errors.add(:email, "must be a csg.com address")
    end
  end

  def sned_confirmation_email
    puts "------------------------------------"
    puts "You successfully created your account"
    puts "------------------------------------"
  end
end

#--------------------------------------------------------

If something is taking really long, the "background" job would do the work while waiting. 
  
Its helpful to stagger the methods to ensure

# --------------------- WEEK 6.2 - DAY  27 -------------------------------

# Question of the Day: What restaurant(s) would you recommend to a local? OPT. What dish(es) from them?


#Hotkey of the day: rails c - rails console abbreviations
#-----------------------------------------------------------------
Cheat sheet:

Author - name, has_many articles
Article - title, content, belongsto Author, has_many comments
Comment - belongsto article

rails new wk6_api --api --database=postgresql
git add .
git commit -m ""

git remote add origin https://github.com/jessicaeri/wk6_api.git
git branch -M main
git push -u origin main

make model and ctrler
  TERMINAL
    rails g model Author name: string
    rails db:migrate
    rails g controller authors

make CRUD app/controller
  index
  show
  create
  update
  destroy

edit routes app/config/routes.rb - so that we can view the index & crud

Serializer
the only attribute would be what we wanted to show.
  ID, key_name, etc. 

  can also add in:

  has_many :articles
      (will add ALL info)
      Can we edit what we want to be added???

gemfile
gem 'active_model_serializers'
bundle install

rails generate serializer Category

app/serializers/author_serializer.rb

class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :articles
end

rails generate serializer Article

class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content #can remove any of these.

  belongs_to :authors
end

ETC

create data authors, articles, comments in SEED
db/seeds.rb
  make sure to put :references

rails db:seed

Test in the Browser or HTTPie
GET /articles => Should list all articles, each using the ArticleSerializer to shape data.
GET /articles/1 => A single article with its category data.
GET /authors => Lists authors.
GET /authors/1 => See that Author's name, and optionally its products if you choose to include them.'

#-------------------------------Custom Serializer --------------------------------------


class AuthorSerializer < ActiveModel::Serializer
  attributes :summary, :length_of_title

  belongs_to :author
  has_many :comments

  def summary
    "Title: #{object.title} - Content #{object.content}
  end

  def length_of_title
    object.title.length
  end
end

#-------------------------------Polymorphism---------------------------------

post - title:string content:text has_many :comments
photos - title:string url:string has_many :comments

rails db:migrate

comments - belongs_to :photos, belongs_to :post

rails g model Comment body:text commentable:references(polymorphic)

rails db:migrate

within schema will create
commentable_type:
commentable_id:

within seeds
post = Post.create(title: "First Post", content: "Hello:)
photo = Photo.create(tite: "Sunset", url: "http://example.com/sunset.jpeg")
Comment.create(body: "Nice post!", commentable: post)
Comment.create(body: "sickkk pic", commentable: photo)

rails db:seed

    *****remember rails c always resets the variable

    photo = Photo.find(1)
    OR
    photo = Photo.first
    OR 
    photo = Photo.find_by(title: "First Post") #needs to be exact even case sensitive
    OR
    photo = Post.where(title: "First Post")
    OR
    Post.select(:id, :title)

test in rails console
post.comments
photo.comments

# --------------------- WEEK 6.3 - DAY  28 -------------------------------

# Question of the Day: Would you rather have a fridge that ran out of food? Or car that never ran out of gas?
#Fridge!!!


#Hotkey of the day: rails s - rails server
#-----------------------------------------------------------------
ACTIVE RECORD
  ORM - Object Relational Mapping 

instead of usig find, where, select youre using a SQl and active record queries 

Direct SQL command
Post.all.to_sql

rails c

example
Post.all
  creating a query to the database 

Post.where(published:true) 
  #finding where this condition (boolean) is true 
  #This filters the records to only include posts where published is true.

Post.order(created_at: :desc)
  #show in descending order 

Post.order(created_at: :asc)
  #show in descending order 

CAN LAYER!!

Post.where(published: true).order(created_at: :asc)

Post.count 
  #counts data entries

Post.limit(10)
  #shows first 10

Post.pluck(:content)
  #shows each of the key values

Post.group(:content).count
  Post - Represents the posts table in the database.
  
  .group(:content) - Groups the records by the content column. This means all posts with the same content value are considered as one group.
  
  .count - Counts the number of records in each group.

Post.select(:id, :title) 
  Does something very similar to Post.all but it only selects the id and title fields
    It does not retrieve all columns, optimizing performance.
  
.joins(:comments)
  This performs an INNER JOIN between the posts table and the comments table.
  It ensures that only posts that have at least one associated comment will be considered.

.group(:id)
  This groups the results by posts.id, meaning it aggregates data per post.
  Necessary for applying the HAVING clause later.

.having('COUNT(comments.id) > 5')
  This filters the grouped results to only include posts that have more than 5 comments.
  Uses SQL’s HAVING clause because aggregate functions (COUNT) cannot be used in WHERE.

.order(:title)
  This sorts the final result by title in ascending order.

#--------------------------Custom Scope ---------------------------------


Within model we can create a scope 

class Photo < ApplicationRecord
  has_many :comments, as: :commentable
  
  validates :title, :url, presence: true 
  scope :is_published, -> {where(published: true)}
  scope :short_title, -> { where('LENGTH(title) < ?',5)}  
end

#-------------------------CONCERN ------------------------------
technically a model but we are putting in a module
  
look at concerns_api for notes
  
#-------------------------- RSPEC -----------------------------------

install gemfile 

gem 'rspec-rails'
gem 'factory_bot_rails'

bundle install
rails generate rspec:install

creates 
  spec folder
    rails_helper
    spec_helper

rails generate rspec:model Order (again for subscription)
    creates
      factories 
        orders.rb
        subscription.rb

