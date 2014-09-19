require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do 
	erb :movie
end

get '/search_results' do
	title = params['search_string']
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }") # Fetch the movie data
	@movie = JSON.parse movie_results # Convert the raw data into a Ruby hash
	erb :movie
end


