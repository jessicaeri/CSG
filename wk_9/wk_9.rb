#week 9.1 - day 41


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