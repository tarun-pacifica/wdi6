require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

get '/' do #Sinatra will serve up anything here and in public automatically
	if params["movie_title"]
		@title = params["movie_title"].sub(' ','+')
		movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @title }")
		movie = JSON.parse movie_results #THIS IS OUR DISPLAY
		@poster = movie['Poster']
		end
		# binding.pry
	erb :forms
end




