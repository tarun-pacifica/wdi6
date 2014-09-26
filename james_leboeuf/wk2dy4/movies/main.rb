require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

require 'pry'
require 'active_record'

# ActiveRecord::Base.logger = Logger.new(STDERR)

# ActiveRecord::Base.establish_connection(
#   :adapter => 'sqlite3',
#   :database => 'butterflies.db'
# )

# require_relative 'butterfly'

# binding.pry

# # Create a movies sqlite database

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
		if @movies['Search'].nil?
			redirect to "/"
		elsif @movies['Search'].length == 1
			sole_movie = @movies['Search'].first
			# binding.pry
			redirect to "/search_id?imdbID=#{sole_movie["imdbID"]}"
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


# @movie_results = @search_results["Search"]
# @solo_movie_title = @movie_results["Title"]












