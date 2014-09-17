# require 'httparty'
# title = params['movie_title']
# movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }") # Fetch the movie data
# movie = JSON.parse movie_results # Convert the raw data into a Ruby hash
# erb movie['Poster']

require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get "/" do
	erb :home
end

get "/search_results" do 
	# if params["movie_name"]
		@title_result = params["movie_name"].downcase.delete(' ').strip
		movie_result = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @title_result }") 
		@movie = JSON.parse movie_result
		@poster = @movie['Poster'].to_s

	# end
	erb :search_results
end
