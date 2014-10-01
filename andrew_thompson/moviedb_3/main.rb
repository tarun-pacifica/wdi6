require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
:adapter => 'sqlite3',
:database => 'movies.db'
)

require_relative 'movie'

before do
	@search = Movie.select(:search).uniq
end

after do
	ActiveRecord::Base.connection.close
end

get '/' do
	erb :movies
end

get '/search' do
	erb :search
end

get '/results' do
	@title = params['movie_search'].sub(' ', '+')
	@movie_results = HTTParty.get("http://www.omdbapi.com/?i=&s=#{ @title }") 
	@movies = JSON.parse @movie_results 
	erb :results
end

get '/movie/:imdbid' do
	imdbid = params['imdbid']
	movie_results = HTTParty.get("http://www.omdbapi.com/?i=#{ imdbid }")
	@movie = JSON.parse movie_results
	erb :movie
end
