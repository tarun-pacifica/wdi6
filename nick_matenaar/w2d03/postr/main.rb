require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'

get '/' do 
	erb :home
end

get '/search' do 
	# Get movie data into hash
	@movie_name = params['search_string']
	movie_url = @movie_name.split(' ').join('%20')
	movie = HTTParty.get("http://www.omdbapi.com/?t="+ movie_url)
	movie = JSON.parse movie

	# Check if real 
	unless movie['Error']
		@poster_url = movie['Poster']
		rating = (movie['imdbRating'].to_f / 2).to_i
		@rating = "" 
		rating.times do 
			@rating << "&star;"
		end 

	else
		@error=true
	end
	erb :search
end 