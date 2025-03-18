#week 9.1 - day 41
#Werid food combo??
  - Mango dilly


#VIEWS - FRONT END 
Model View Contoller 
- implements frontend views and controller logic to display what you want

rails new blog_app -d postgresql
rails db:create

1. Create the View (front-end)
Note:
# <% ... %>: #Executes Ruby code but doesnt print anything.
# <%= ... %>: #Executes Ruby code and outputs the result into the HTML.

#INDEX
app/views/posts/index.html.erb
*create the posts folder and index file

<h1>Posts</h1> #displays posts on page

<% @posts.each do |post| %> #loops posts array
  <div class="post">
    <h2><%= post[:title] %></h2> #display title
    <p>By: <%= post[:author] %></p> #display author
    <p><%= post[:content] %></p> #display content
  </div>
<% end %>

#SHOW
app/views/posts/show.html.erb

<h1>In the Posts Show View</h1>

<h1><%= @post[:title] %></h1>

<p>By: <%= @post[:author] %></p>
<p><%= @post[:content] %></p>

<%= link_to 'Back to Posts Index', posts_path %> #Adds a link to return to the list of posts


2. Create the Controller 
app/controller/posts_controller 
rails g controller Posts
  Creates the following:
  - controller files
  - view folder
  - helps files
  - asset files


class PostsController < ApplicationController
  def index
    @posts = [
      { id: 1, title: "First Post", content: "Welcome to my blog!", author: "Alice" },
      { id: 2, title: "Learning Rails", content: "Today I learned about MVC.", author: "Bob" },
      { id: 3, title: "Full-Stack Development", content: "Rails makes it easy!", author: "Charlie" }
    ]
  end
  
  def show
    post_id = params[:id].to_i
    @post = {
      id: post_id,
      title: "Post #{post_id}",
      content: "Content for post #{post_id}",
      author: "Author #{post_id}"
    }
  end
end

3. Route the request 
config/routes.rb

Rails.application.routes.draw do
  resources :posts, only: [:index, :show]
end

4. Start Rails Server and Test
all posts - index: http://localhost:3000/posts
ind. post - show: http://localhost:3000/posts/id#

#EXERCISE
- implement user and comments

all users - index: http://localhost:3000/users
ind. user - show: http://localhost:3000/users/1
show comment on post - show: http://localhost:3000/posts/1/comments/1

#Addind Models - DATABASE

1. create model
  rails g model Post title:string content:text author:string

confirm then migrate 
  rails db:migrate

2. in model 
  - create associations 
  - create validations 
  - etc. 

controller.rb 
  - delete hardcoded data in index
    - @posts = Post.all

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts  # Get all posts belonging to this user
  end
end

create data in seeds.rb
# Create sample data

alice = User.create([
  { name: "Alice", email: "alice@example.com" }
])

bob = User.create([
  {name: "Bob", email: "bob@example.com" }
])

puts "Seeded #{User.count} users."


Post.create([
  { title: 'First Post', content: 'This is the first post.', user_id: 1},
  { title: 'Second Post', content: 'Learning Rails is fun!', user_id: 2}
])

puts "Seeded #{Post.count} posts."

edit the views:

#I want it so that if I am in a user profile I can see all their posts.

<h1><%= @user.name %>'s Profile</h1>
<p>Email: <%= @user.email %></p>

<h2>Posts by <%= @user.name %></h2>

<% if @posts.any? %>
  <% @posts.each do |post| %> #displays each post
    <div class="post">
      <h3><%= link_to post.title, post_path(post) %></h3> #links to post 
      <p><%= post.content %></p>
    </div>
  <% end %>
<% else %>
  <p>No posts available.</p>
<% end %>

<%= link_to 'Back to Users', users_path %>

#NEW HTML.ERB in Post
app/views/posts/new.html.erb

<h1>New Post</h1>

<%= form_with model: @post do |form| %>
  <p>
    <%= form.label :title %><br> #creates label
    <%= form.text_field :title %> #creates text field
  </p>
  <p>
    <%= form.label :content %><br>
    <%= form.text_area :content %>
  </p>
  <p>
    <%= form.label :author %><br>
    <%= form.text_field :author %>
  </p>

  <%= form.submit 'Create Post' %> #title of button to submit form

<% end %>

<%= link_to 'Back to Posts', posts_path %>

    #we need to ensure to make a create method w/in controller 
    to actually save the data
  def create
    @post = Post.new(
      title: params["post"]["title"], #you have to go one layer in to access
      content: params["post"]["content"],
      author: params["post"]["author"]
    )

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

#><--------------------------

# Week 9 Day 42 
#Question of the day: 
If you were a soda what soda would you be?
    - Mcdonalds Melon Soda bc its a bit weird but its great


#--------------------------------------------------------------

NOTE: comments

html 
  <!-- Write your comments here -->
erb
  <%# This is a great comment! %>

User feedback is crucial for user experience...

FLASH ALERT - to store short lived messages
  think of them like the "puts 'successfully seeded.'"

  app/views/layouts/application.html.erb
      #by putting it in the application file it would be available 
      IN ALL HTML FILES

  <!-- Flash Messages -->
</html>
  .....
  LOTS OF CODE
  .....

  <body>
    <% flash.each do |key, message| %>
      <div class="flash <%= key %>"> #class name
        <%= message %> 
      </div>
    <% end %>

    <%= yield %>
  </body>
</html> 

"

message would be found in the controller folders
ex: Post controller update

flash |key| = notice:
redirect_to @post, notice: 'Post was successfully updated.' #<- flash |message|
flash[:notice] = 'message'

basically rails automatically makign a short lived call but the redirect_to
is built into rails that makes it so that when it is called it triggers 
flash!


"
where we put it makes a difference... 

usually want flash ABOVE yield!! Yield is referencing the start of
the "view" for your html page...

#--------- DRY CODE-------------
Do Not
  Repeat
    Yourself

Easily able to copy and paste! BUT a PREFERRED method would just 
to reference code 
  bc if it works IT WORKS

Made form code and am referecing it within the new post html

#-------
app/views/posts/form.html.erb

<%= form_with model: @post do |form| %>
  <p>
    <%= form.label :title %><br> #creates label
    <%= form.text_field :title %> #creates text field
  </p>
  <p>
    <%= form.label :content %><br>
    <%= form.text_area :content %>
  </p>
  <p>
    <%= form.label :author %><br>
    <%= form.text_field :author %>
  </p>

  <%= form.submit %> #title of button to submit form

<% end %>

#-----
app/views/posts/new.html.erb
<h1>New Post</h1>

<%= render 'form' %> #basically repeats the forms html code

<%= link_to 'Back to Posts', posts_path %>

#-------------- EDIT --------------------

posts controller.rb 

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
  
  if @post.update(
      title: params["post"]["title"] || post.title,
      content: params["post"]["content"] || post.content,
      author: params["post"]["author"] || post.author
    )
    redirect_to @post, notice: 'Post was successfully updated.'
  else
    render :edit
  end
end

views/posts/edit.html.erb

<h1>Edit Post</h1>

<%= render 'form' %>

<%= link_to 'Back to Posts', posts_path %>


BUT NEED TO EDIT THE SHOW.HTML

app/views/posts/show.html.erb
<h1>In the Posts Show View</h1>

<h1><%= @post[:title] %></h1>

<p>By: <%= @post[:author] %></p>
<p><%= @post[:content] %></p>

<%= link_to 'Back to Posts Index', posts_path %>
<br>
<br>
<%= link_to 'Edit Post', edit_post_path %>

"
#--------------------------------------------
assets/stylesheets/application.css:
/* Flash message styles */
.flash {
  padding: 10px 15px;
  margin: 10px 0;
  border-radius: 4px;
  font-weight: bold;
}

.flash.notice {
  background-color: #4CAF50; /* Green */
  color: white;
}

.flash.alert {
  background-color: #f44336; /* Red */
  color: white;
}

javascript/application.js
// Auto-hide flash messages after 3 seconds
document.addEventListener("turbo:load", function() {
  const flashMessages = document.querySelectorAll('.flash');
  
  flashMessages.forEach(function(flash) {
    // Set a timeout to hide the flash message after 3 seconds
    setTimeout(function() {
      flash.style.transition = "opacity 0.5s ease";
      flash.style.opacity = 0;
      
      // Remove the element from the DOM after the fade out
      setTimeout(function() {
        flash.remove();
      }, 500);
    }, 3000);
  });
});

#-------------------
DESTROY!!!!

Have a delete button in the show.html.erb


<br>
<br>
<%= button_to 'Delete', @post, method: :delete, data: {turbo_confirm: 'Are you sure?'} %>


    When "delete post" clicked
    pop up w/ message would show up 
        
postcontroller.rb

def destroy
    @post = Post.find(params[:id])
    @post.destroy # not referencing line 46 (the destroy above)
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end



comment
- belongs to user 
- belongs to post
  




    