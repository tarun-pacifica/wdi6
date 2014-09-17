require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'uri'

get '/' do
	unless params[:movie_poster].nil?
	title = URI.escape(params['movie_poster'])
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }") # Fetch the movie data
	@movie = JSON.parse(movie_results)['Poster'] # Convert the raw 
	end

	erb :movies
	
end
