require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do
	erb :movies	
end

get '/search_result' do
	title = params['search_string'].sub(' ', '+')
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }") # Fetch the movie data
	@movie = JSON.parse(movie_results)['Poster'] # Convert the raw 

	erb :search
	
end
