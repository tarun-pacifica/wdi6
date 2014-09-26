#Build a search form that lets the user enter a movie name. The Sinatra app will use HTTParty to fetch the data for the chosen movie from OMDB and display it on the page.

#build movies.rb which gets '/' and '/result' and links them to erb search and erb result



require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do
	erb :search
end

get '/result' do
	title=params['movie_title']
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }")
	@movie = JSON.parse movie_results
	@poster = @movie['Poster'].to_s
	# erb movie['Poster']
	erb :result
end
