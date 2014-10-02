require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'HTTParty'

get '/' do
	erb :movies
end

get '/results' do
	title = params['movie_search'].sub(' ', '+')
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }") # Fetch the movie data
	@movie = JSON.parse movie_results # Convert the 'json-formatted' data into a Ruby hash
	@poster=@movie['Poster']
	@plot=@movie['Plot']
	erb :results
end

# title = params['movie_title']
# movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }") # Fetch the movie data
# movie = JSON.parse movie_results # Convert the raw data into a Ruby hash
# erb movie['Poster']
# end


# get '/' do
#   erb :layout
# end

# get '/search' do
#   erb :search	
# end





