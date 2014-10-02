require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get	'/' do
	if params['movie_title']
	    @title = params['movie_title'].gsub(' ','+')
	    movie_result = HTTParty.get("http://www.omdbapi.com/?i=&s=#{ @title }")
	    @movies = JSON.parse movie_result
	end
	erb :home
end

get '/results' do
	if params['movie_title']
		@title = params['movie_title'].gsub(' ','+')
		movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @title }")
		movie = JSON.parse movie_results
		@title = movie['Title']
		@plot = movie['Plot']
		@actors = movie['Actors']
		@director = movie['Director']
		@poster = movie['Poster']
	end 
	erb :results
end





