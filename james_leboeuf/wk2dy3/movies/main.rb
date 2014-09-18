require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

get '/' do #Sinatra will serve up anything here and in public automatically
	erb :forms
end

get '/search_results' do
	# if params["movie_title"]
		@title = params["movie_title"].gsub(' ','+')
		movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @title }")
		movie = JSON.parse movie_results #THIS IS OUR DISPLAY
		@poster = movie['Poster']
		@plot = movie['Plot']
		@year = movie['Year']
	# end
	erb :search_results
end







