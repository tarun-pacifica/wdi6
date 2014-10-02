require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'movies.db'
)

require_relative 'movie'

after do
	ActiveRecord::Base.connection.close
end

get	'/' do
	erb :blank
end

get '/movies' do
	@movies = get_movies(params['movie_title'])
	erb :movies
end

get '/movie' do
	@imdb_id = params['imdb_id']
	@movie = Movie.find_by(imdbid: params['imdb_id']) # using the previous variable of title to call from database find_by = Column name & value
	unless @movie
		m = get_movie(title)
		@movie = Movie.new( title: m['Title'], imdbid: m['imdbID'], poster: m['Poster'], plot: m['Plot'], year: m['Year'], actors: m['Actors'])
		@movie.save
	end
	erb :movie
end

def get_movies(movie_title)
	@title = params['movie_title'].gsub(' ','+')
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=&s=#{ @title }")
	if movie_results
		JSON.parse(movie_results)
	else
		{}
	end
end

def get_movie(movie_title)
	movie = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ movie_title }")
	if movie
		@movie = JSON.parse(movie)
	else
		{}
	end
end













