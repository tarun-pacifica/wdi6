
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do 
	erb :movie
end 


get '/movie' do 
	title = params['movie_title'].gsub " ", '+'
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }") # Fetch the movie data
	@movie = JSON.parse movie_results # Convert the raw data into a Ruby hash
	erb :poster
end 

# get '/result' do 
# 	# title = params['search_movie'].gsub " ", '+'
# 	# movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }") # Fetch the movie data
# 	@movie = JSON.parse movie_results # Convert the raw data into a Ruby hash
# 	erb :poster
# end
