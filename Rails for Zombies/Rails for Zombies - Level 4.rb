# Controllers Must Be Eaten

# Where you use models to get data, and use views to display data

# Views
# Models
# Controllers
# Routers

# Convetntion over Configuration

# Request /tweets/1
#/app/controllers/tweets_controller.rb

class TweetsController < ApplicationController
	def show
		@tweet = Tweet.find( params[:id] )
		respond_to do |format|
			format.html
			format.json { render json: @tweet }
			format.xml { render xml: @tweet }
		end
	end
end

# /app/views/tweets/show.html.erb

# Parameters
# /tweets?status=Im dead
params = { status: "I'm dead" }
@tweet = Tweet.create( status: params[:status])

# /tweets?tweet[status]=Im dead
params = {tweet: {status: "I'm dead" }}
@tweet = Tweet.create(status: params[:tweet][:status])
@tweet = Tweet.create(params.required(:tweet).permit(:status))

# Controller Actions
class TweetsController < ApplicatoinController
	def index			#	=>	List all tweets
	end

	def show 			# =>	Show a single tweet
	end

	def new 			# =>  Show a new tweet form
	end

	def edit			# =>  Show an edit tweet from
	end

	def create		# =>  Create a new tweet
	end

	def update		# =>  Update a tweet
	end

	def destroy		# =>  Delete a tweet
	end
end

