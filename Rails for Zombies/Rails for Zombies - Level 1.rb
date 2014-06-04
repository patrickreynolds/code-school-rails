# Deep in the Crud

# => Create 
# Create a tweet
t = Tweet.new
t.status = "I <3 brains."
t.save

# Could also pass parameters to create
t = Tweet.new(
	status: "I <3 brains",
	zombie: "Jim")
t.save

# Lastly, could create and save a tweet.
Tweet.create(
	status: "I <3 brains.",
	zombie: "Jim"
)

# => Read 
# Read a tweet
Tweet.find(3)

# Could also send in multiple parameters
Tweet.find(3, 4, 5) # Returns an array of tweets, id of 3, 4, or 5

# Read the first tweet
Tweet.first

# Read the last tweet
Tweet.last

# Return all tweets
Tweet.all

# Return total number of tweets
Tweet.count

# Returns all tweets, ordered by zombies
Tweet.order(:zombie)

# Returns the first 10 tweets
Tweet.limit(10)

# Returns all tweets from zombie named 'ash'
Tweet.where(zombie: "ash")

# Returns only tweets from zombie 'ash'
# ordered by status
# only the first 10
Tweet.where(zombie: "ash").order(:status).limit(10)

# => Update 
# Update a tweet
t = Tweet.find(3)
t.zombie = "EyeballChomper"
t.save

# Update multiple attributes
t = Tweet.find(2)
t.attributes = {
	status: "Can I munch your eyeballs?",
	zombie: "EyeballChomper"
}
t.save

# Alternatively
t = Tweet.find(2)
t.update(
	status: "Can I munch your eyevalls?",
	zombie: "EyeballChomper"
)


# => Delete 
# Delete a tweet
t = Tweet.find(3)
t.destroy

# Alternatively
Tweet.find(2).destroy

# Delete all tweets
Tweet.destroy_all