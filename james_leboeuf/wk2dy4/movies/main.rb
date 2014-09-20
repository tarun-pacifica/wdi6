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
		movie_results = HTTParty.get("http://www.omdbapi.com/?i=&s=#{ @title }")
		# binding.pry
		@movies = JSON.parse movie_results
		# @at_length = @movies["Search"]
		if @movies['Search'].length == 1
			# sinatra redirect to /search_id?imdbID=<%=f["imdbID"]%>
		end

	erb :search_results
end

get '/search_id' do
	@id = params["imdbID"]
	movie_result = HTTParty.get("http://www.omdbapi.com/?i=#{ @id }")
	movie = JSON.parse movie_result
	@poster = movie['Poster']
	@plot = movie['Plot']
	@year = movie['Year']
	@title = movie["Title"]
	erb :search_id
end












