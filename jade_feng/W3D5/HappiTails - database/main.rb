require 'sinatra'
require 'pry'
require 'sinatra/reloader'
require 'sqlite3'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'happitails.db'
)

require_relative "client"
require_relative "animal"

get '/' do 
	erb :index
end

####### Animals ########
get '/animals' do  		# Get page of all animals - unadopted or otherwise
	erb :listanimals
end

get '/unadopted' do 	# Get page of unadopted animals 
	erb :listanimals
end

get '/animal/:id' do 	# Choose an animal to investigate
	erb :showanimal
end

get '/newanimal' do 	# Add an animal
	erb :newanimal
end 

# Delete an animal
# Edit an animal

###### Clients ########

get '/clients' do  		# List clients on a page
	erb :listclients
end

get '/client/:id' do 	# Choose one client to look at -- need to include pet list
	erb :showclient
end

get '/newclient' do 	# Add a new client
	erb :newclient
end

# Delete a client
# Edit a client