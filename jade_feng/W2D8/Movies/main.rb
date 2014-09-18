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
		@title_result = params["movie_name"].downcase.strip.gsub! /\s+/, '+' 	#Regular expressions (REGEX) to manipulate expressions
		movie_result = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @title_result }") 
		@movie = JSON.parse movie_result
	# Output here
		@title = @movie['Title'].to_s
		@poster = @movie['Poster'].to_s
		if @poster != "N/A"
			@poster = @movie['Poster'].to_s
		else
			@poster = "http://www.notsuperhuman.com/wp-content/uploads/2011/03/5501618311_1eeec26185_z_large.jpg"
		end
		@year = @movie['Year'].to_s
		@rated = @movie['Rated'].to_s
		@released = @movie['Released'].to_s
		@runtime = @movie['Runtime'].to_s
		@genre = @movie['Genre']
		@director = @movie['Director'].to_s
		@writer = @movie['Writer'].to_s
		@actors = @movie['Actors'].to_s
		@plot = @movie['Plot'].to_s
		@language = @movie['Language'].to_s
		@country = @movie['Country'].to_s 
		@awards = @movie['Awards'].to_s
		# @metascore = @movie['Metascore'].to_s
		@imdbRating = @movie['imdbRating'].to_s
		# @imdbVotes ] = @movie['imdbVotes'].to_s
		@imdbID = @movie['imdbID'].to_s
		@type = @movie['Type'].to_s
		# @response = @movie['Response']
	if @title.empty? 
		erb :not_found
	else
		erb :search_results
	end 
end

get "/not_found" do 
	erb :not_found
end


get "/wall" do
	erb :wall
end

# Nick's Code: https://github.com/Nicktho/wdi6/tree/master/nick_matenaar/w2d03/postr
# get '/search' do 
# 	# Get movie data into hash
# 	@movie_name = params['search_string']
# 	movie_url = @movie_name.split(' ').join('%20')
# 	movie = HTTParty.get("http://www.omdbapi.com/?t="+ movie_url)
# 	movie = JSON.parse movie

# 	# Check if real 
# 	unless movie['Error']
# 		@poster_url = movie['Poster']
# 		$posters_hash[@movie_name] = @poster_url
# 		rating = (movie['imdbRating'].to_f / 2).to_i
# 		@rating = "" 
# 		rating.times do 
# 			@rating << "&star;"
# 		end 
		
# 	else
# 		@error=true
# 	end
# 	erb :search
# end 

# get "/searchwall" do 
# 	@code = " "
# 	$posters_hash.each do |name, img|
# 		@code << '<a href="/search?search_string='+name+'"><img src="'+img+'" class="resize"></a>'
# 	end 
# 	erb :searchwall
# end