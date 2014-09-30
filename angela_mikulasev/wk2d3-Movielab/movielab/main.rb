require 'sinatra'
require 'sinatra/reloader'
require 'httparty'


get '/movie' do
	if params['movie_title']
		@title = params['movie_title'].sub(' ', '+')
		movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @title }") # Fetch the movie data
		movie = JSON.parse movie_results # Convert the raw data into a Ruby hash
		@poster = movie['Poster']
	end
	erb :movie
end


# HTTParty.get is a HTTParty::Response