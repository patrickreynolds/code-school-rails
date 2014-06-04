# From the Ground Up

# Installing Rails
Running Rails from the console will give us instructions

rails server => Runs rails server

# Rails s

# rails generate
# rails g

rails g scaffold NAME [field:type field:type]

# Example
rails g scaffold zombie name:string bio:text age:integer

# Data Types
string, text, integer, boolean, decimal, float, binary, date, time, datetime

class CreateZombies < ActiveRecord::Migration
	def change
		create_table :zombies do |t|
			t.string :name
			t.text :bio
			t.integer :age

			t.timestamps
		end
	end
end

t.datetime :created_at # Date & time automatically set on create
t.datetime :updated_at # and update events

# Forgot to migrate database is very common
rake db:migrate

# Rails console
rails console
Zombie.create(name: "Eric Allam", age: 27)
z = Zombie.first
z.name = "Caike Souza"
z.save
# => true

# making changes to the database
# Adding columns
rails g migration AddEmailAndRottingToZombies email:string rotting:boolean
rake db:migrate

# Undo the most recent migration
rake db:rollback

# Dump the current db state
rake db:schema:dump

# Creates the db, loads schema, & seed
rake db:setup


# How do we remove them?
rails g migrateion RemoveAgeFromZombies age:integer

# Migration commands
rename_column :zombies, :bio, :description
rename_table :zombies, :ghouls
drop_table :zombies
change_column :zombies, :age, :integer, limit: 4
change_column_default :zombies, :is_admin, default: true

# Anything else
rails g migration DropZombiesTable

class DropZombiesTable < ActiveRecord::Migration
	def up
		drop_table :zombies
	end

	def down
		create_table :zombies do |t|
			t.string 	:name
			t.text 		:bio
			t.integer :age
			t.timestamps
		end
	end
end

# Bundler in the Gemfile

# Updating gems
bundle install

# Adding fields to the tweets table
class AddLocationToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :location, :string, limit: 30
    add_column :tweets, :show_location, :boolean, default: false
  end
end

# Renaming columns
class AddLocationToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :location, :string, limit: 30
    add_column :tweets, :show_location, :boolean, default: false
    add_column :tweets, :category_name, :string
    rename_column :tweets, :status, :message
  end
end

# Removing category name column
class RemoveCategoryNameFromTweets < ActiveRecord::Migration
  def up
    remove_column :tweets, :category_name
  end

  def down
    add_column :tweets, :category_name, :string
  end
end























