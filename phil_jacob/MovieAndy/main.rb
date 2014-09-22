require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'


get '/' do
	erb :movies
end

get '/search' do
	erb :search
end

# get '/results' do
# 	@title = params['movie_search'].sub(' ', '+')
# 	@movie = HTTParty.get("http://www.omdbapi.com/?i=&#{ @title }") # Fetch the movie data
# 	@movie_results = JSON.parse @movie['Poster'] # Convert the 'json-formatted' data into a Ruby hash
# 	@poster = @movie['Poster']
# end
# 	erb :results
# end

get '/results' do
	@title = params['movie_search'].gsub(' ', '+')
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @title }") # Fetch the movie data
	@movie = JSON.parse movie_results # Convert the 'json-formatted' data into a Ruby hash
	@poster=@movie['Poster']
	@plot=@movie['Plot']
	erb :results
	end

get '/list' do
	@list = params['movie_search'].gsub(' ', '+')
	list_results = HTTParty.get("http://www.omdbapi.com/?i=&s=#{ @list }")
	@movies = JSON.parse list_results # Convert the 'json-formatted' data into a Ruby hash
	@movies["Search"].each do |movies|
		@movies["Title"]
	end
	erb :list
end






