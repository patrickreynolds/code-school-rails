# Models Still Taste Like Chicken

# Named Scope
# Callbacks
# Has_one
# Relationship Options
# Using Inclues
# has_many :through

# Checking to see when the zombie age is greater than 20
# Scope 
class Tweet < ActiveRecord::Base
  scope :recent, order('created_at desc').limit(4)
end

# Zombies model

class Zombie < ActiveRecord::Base
	before_save :make_rotting

	def make_rotting
		self.rotting = true if age > 20
	end
end

# Active Record Callbacks
before_validation
after_validation

before_save
after_save

before_update
after_update

before_destroy
after_destroy

# has_one
rails g model brain zombie_id:integer status:string flavor:string

# Migration..
class CreateBrains < ActiveRecord::Migration
	def change
		create_table :brains do |t|
			t.integer :zombie_id
			t.string :status
			t.string :flavor
		end
		add_index :brains, :zombie_id # Foreign Key
	end
end

rake db:migrate

# Brain model => app/models/brain.rb
class Brain < ActiveRecord::Base
	belongs_to :zombie
end

# Zombie model => app/models/zombie.rb
class Zombie < ActiveRecord::Base
	has_one :brain, dependent: :destroy # Used to cascase
end

# Relationship Options
dependent: :destroy # => Will call destroy on associated objects

foreign_key: :undead_id # => Changes the associated key

primary_key: :zid # => Changes the primary key

validate: true # => When zombie validates brain will too


# Ralationship "include" option similar to SQL WHERE
# app/views/zombies/zombies_controller.rb
def index
	@zombies = Zombie.includes(:brain).all
end

# app/views/zombies/index.html.erb
# <% @zombies.each do |zombie| %>
# 	<tr>
# 		<td><%= zombie.name %></td>
# 		<td><%= zombie.brain.flavor %></td>
# 	</tr>
# <% end %>


# Has_many :through
db/migrate/xxx_create_assignments.rb

class CreateAssignments < 
	def change
		create_table :assignments do |t|
			t.integer :zombie_id
			t.integer :role_id
		end
		add_index :assignments, :zombie_id
		add_index :assignments, :role_id
	end
end

class CreateRoles <
	def change
		create_table :roles do |t|
			t.string :title
		end
	end
end

# app/models/zombie.rb
class Zombie < ActiveRecord::Base
	has_many :assignments
	has_many :roles, through: :assignments
end

# app/models/role.rb
class Role < ActiveRecord::Base
	has_many :assignments
	has_many :zombies, through: :assignments
end

# app/models/assignment.rb
class Assignment < 
	belongs_to :zombie
	belongs_to :role
end




