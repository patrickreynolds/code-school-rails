# Models Taste Like Chicken

# app/models/tweet.rb  # => maps to tweets table
class Tweet < ActiveRecord::Base
	validates_presence_of :status
end

# Model Validations

# Make sure something is a number
validates_numericality_of :fingers

# Make sure something is unique
validates_uniqueness_of :toothmarks

# Validates confirmation of say two passwords are equal
validates_confirmation_of :password

# Validates acceptance of say checkbox 
validates_acceptance_of :zombification

# Validates lenght of is longer than 3 characters
validates_length_of :password, minimum: 3

# Validates format of for email or phone number 
validates_format_of :email, with: /regex/i

# Validates inclusion of to make sure age is between two values 
validates_inclusion_of :age, in: 20..99

# Validates exclustion of to make sure age is not between two values 
validates_exclusion_of :age, in: 0...21,
message: "Sorry you must be over 21"

# Alternative syntax
validates :status, presence: true
validates :status, length: { minimum: 3 }

validates :status,
					presence: true,
					length: { minimum: 3 },
					presence: true,
					uniqueness: true,
					numericality: true,
					length: { minimum: 0, maximum: 2000 },
					format: { with: /.*/ },
					acceptance: true,
					confiration: true


# Relationships
# app/models/zombie.rb
class Zombie < AvtiveRecord::Base
	has_many :tweets

end

# app/models/tweet.rb
class Tweet < ActiveRecord::Base
	belongs_to :zombie

end

# Test Code
ash = Zombie.find(1)
t = Tweet.create(status: "Your eyelids taste like bacon.",
								zombie: ash)
ash.tweets.count # => 3
ash.tweets # => Array of three instances of tweets that belong to ash

# Fetch a tweet from a database
t = Tweet.find(5)
t.zombie # => returns zombie instance
t.zombie.name # => Ash



# t = Tweet.new
# t.save # => False
# t.errors.messages => {status:["can't be blank"]}
# t.errors[:status][0]








