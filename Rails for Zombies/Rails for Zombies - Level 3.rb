# The Views Ain't Always Pretty

# Views
# Models
# Controllers
# Routers

# ERB - Embedded ruby code

# app/views/tweets/show.html.erb
# <% tweet = Tweet.find(1) %>
# <h1><%= tweet.status %></h1>
# <p>Posted by <%= link_to tweet.zombie.name, zombie_path(tweet.zombie) %></p>
# Alternatively => <p>Posted by <%= link_to tweet.zombie.name, 
# 																	tweet.zombie, 
# 																	confirm: "Are you sure?" %>

# Rails documentation: cd rails grep -rin 'def link_to'
# api.rubyonrails.org


# /app.views/tweets/index.html.erb
<h1>Listing tweets</h1>
<table>
	<tr>
			<th>Status</th>
			<th>Zombie</th>
	</tr>
<% tweets = Tweet.all %>
<% tweets.each do |tweet| %>
	<tr>
		<td><%= link_to tweet.status, tweet %></td>
		<td><%= link_to tweet.zombie.name, tweet.zombie %></td>
		<td><%= link_to "Edit", edit_tweet_path(tweet) %></td>
		<td><%= link_to "Destroy", tweet, method: :delete %></td>
	</tr>
<% end %>
<% if tweets.size == 0 %>
	<em>No Tweets Found</em>
<% end %>
</table>

# URL Generators
# Action								Code 								The URL
List all tweets     tweets_path							/tweets
New tweet form      new_tweet_path     			/tweets/new
Show a tweet 				tweet 									/tweets/1
Edit a tweet        edit_tweet_path(tweet) 	/tweets/1/edit
Delete a tweet 			tweet, method: :delete 	/tweets/1
