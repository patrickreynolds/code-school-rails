# Rest In Pieces

# Understanding REST
# Revisit URL Helpers
# Forms & Input Helpers
# Nested Resources
# View Partials
# Other View Helpers


# REST - Representational State Transfer
# 1. Resources (noun) addressable through URI
# 2. Standard methods (verb) GET, POST, PUT, DELETE
# Checkout Resful Services

# Actions		show		create		update		destroy
# SQL				select	create		update		delete
# REST 			GET			POST			PUT				DELETE

# GET => 		<%= link_to 'show', zombie %>
# POST => 	<%= link_to 'create', zombie, method: :post %>
# PUT =>  	<%= link_to 'update', zombie, method: :put %>
# DELETE => <%= link_to 'delete', zombie, mehtod: :delete %>


# List all Routes
rake routes


# Input Helpers
# <%= f.text_area :bio %> - Renders a multiline text text area
# <%= f.check_box :rotting %> - Check box used for booleans
# <%= f.radio_button :decomp, 'fresh', checked: true %>
# <%= f.radio_button :decomp, 'rotting'%>
# <%= f.radio_button :decomp, 'stale'%>

# <%= f.select :decomp, ['fresh', 'rotting', 'stale'] %> - Select box with three options
# <%= f.select :decomp, [['fresh', 1], ['rotting', 2], ['stale', 3]] %> - Select box with three options, each with numerical value

# Text Input Helpers
# <%= f.password_field :password %>
# <%= f.number_field :price %>
# <%= f.range_field :quantitiy %>
# <%= f.email_field :email %>
# <%= f.url_field :website %>
# <%= f.telephone_field :mobile %>


# Nexted Routes

# app/config/routes.rb
TwitterForZombies::Application.routes.draw do
	resources :zombies do
		resources :tweets
	end
end

# Update the controller
# app/controller/tweets_controller.rb
class TweetsController < ApplicationControler
	before_filter :get_zombie

	def get_zombie 
		@zombie = Zombie.find(params[:zombie_id])
	end

	def index 
		@tweets = @zombie.tweets
	end

	def show
		@tweet = Zombie.tweets.find(params[:id])
	end
end
