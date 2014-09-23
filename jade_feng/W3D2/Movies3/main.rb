# require 'httparty'
# title = params['movie_title']
# movie_results = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ title }") # Fetch the movie data
# movie = JSON.parse movie_results # Convert the raw data into a Ruby hash
# erb movie['Poster']

require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
	:adapter => 'sqlite3',
	:database => 'movies.db'
)

require_relative 'movie'

#################################################################

get "/" do
	erb :home
end


############### SEARCH PAGE ####
get "/search_list" do
	@title_result = params["movie_name"].downcase.strip.gsub /\s+/, '+' 
	movie_list = HTTParty.get("http://www.omdbapi.com/?s=#{ @title_result }") 
	@list_of_movies = JSON.parse movie_list

	if @list_of_movies.has_key?("Error")
		erb :not_found
	elsif @list_of_movies["Search"].count.to_i > 1
		@movie_list_array = @list_of_movies["Search"]
		
		@name_ID_hash = {}
		@movie_list_array.each do |movie_hash|
			@ID = movie_hash["imdbID"]
			@title = movie_hash["Title"]
			@name_ID_hash[@ID] = @title 
		end

		erb :search_list
		
	elsif @list_of_movies["Search"].count.to_i == 1
			@number_of_movies = @list_of_movies["Search"].count
			@title_result = params["movie_name"].downcase.strip.gsub /\s+/, '+' 	#Regular expressions (REGEX) to manipulate expressions
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
			@imdbRating = @movie['imdbRating'].to_s
			@imdbID = @movie['imdbID'].to_s
			@type = @movie['Type'].to_s
		erb :search_results
	end 
end

############### MOVIE PAGE ####
get "/search_results" do 
	@id_result = params["id_result"]

	# check if movie searched for is in database
	movie = Movie.find_by(:imdbID => @id_result)
	
	if movie.nil?
		movie = Movie.new
		movie.imdbID = @movies.imdbID
		movie.title = @movies.title
		movie.poster = @movies.poster
		movie.save
	end


	### check if id_result is already in movies.db, then we pull out the information from movies.db
	class Movie
		movie_result = HTTParty.get("http://www.omdbapi.com/?i=#{ @id_result }&t=") 
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
		@imdbRating = @movie['imdbRating'].to_s
		@imdbID = @movie['imdbID'].to_s
		@type = @movie['Type'].to_s
	end
		# push this back into the database 

	erb :search_results
end

get "/not_found" do 
	erb :not_found
end

