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
require 'pry'

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
	else 
		@movie_list_array = @list_of_movies["Search"]

		@name_ID_hash = {}
		@movie_list_array.each do |movie_hash|
			@ID = movie_hash["imdbID"]
			@title = movie_hash["Title"]
			@name_ID_hash[@ID] = @title 
		end
		erb :search_list
	end
end

############### MOVIE PAGE ####
get "/search_results" do 
	@id_result = params["id_result"]
	@imdbID = Movie.find_by_imdbID(@id_result)
	# check if movie searched for is in database

	### check if id_result is already in movies.db, then we pull out the information from movies.db
	if @imdbID.nil?
		movie_result = HTTParty.get("http://www.omdbapi.com/?i=#{ @id_result }&t=") 
		@movie = JSON.parse movie_result

	# Output here
		@movies = Movie.new
		@movies.title = @movie['Title'].to_s
		@movies.poster = @movie['Poster'].to_s
		if @movies.poster != "N/A"
			@movies.poster = @movie['Poster'].to_s
		else
			@movies.poster = "http://www.notsuperhuman.com/wp-content/uploads/2011/03/5501618311_1eeec26185_z_large.jpg"
		end
		# @movies.year = @movie['Year'].to_s
		# @movies.rated = @movie['Rated'].to_s
		# @movies.released = @movie['Released'].to_s
		# @movies.runtime = @movie['Runtime'].to_s
		# @movies.genre = @movie['Genre']
		# @movies.director = @movie['Director'].to_s
		# @movies.writer = @movie['Writer'].to_s
		# @movies.actors = @movie['Actors'].to_s
		# @movies.plot = @movie['Plot'].to_s
		# @movies.language = @movie['Language'].to_s
		# @movies.country = @movie['Country'].to_s 
		# @movies.awards = @movie['Awards'].to_s
		# @movies.imdbRating = @movie['imdbRating'].to_s
		@movies.imdbID = @movie['imdbID'].to_s
		# @movies.type = @movie['Type'].to_s
		  
		@movies.save

			erb :search_results
	end
	
	erb :search_results
end

get "/not_found" do 
	erb :not_found
end

