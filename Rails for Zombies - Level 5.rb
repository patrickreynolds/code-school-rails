# Routing Into Darkness

# Application Stack

# Router -> Controllers -> Models -> Views -> Browser

class ZombieTwitter:Application.routes.draw  do
	resources :tweets
	resources :zombies
	root to: "tweets#index"
	get '/new_tweet' => 'tweets#new'
	get '/all' => 'tweets#index', as: 'all_tweets'
	get '/all' => redirect('/tweets')

	# zpcode
	get 'local_tweets/:zipcode' => 'tweets#index', as: 'local_tweets'

	get ':name' => 'tweets#index', as: 'zombie_tweets'
end

# <%= link_to "All Tweets", all_tweets_path %>


# What if we wanted to give the option to retrieve tweets by zipcode?

def index 
	if params[:zipcode]
		@tweets = Tweet.where(zipcode: params[:zipcode])
	elsif params[:name]
		@zombie = Zombie.where(name: params[:name]).first
		@tweets = @zombie.tweets
	else
		respond_to do |format|
			format.html # index.html.erb
			format.xml { render xml: @tweets }
		end
	end
end

