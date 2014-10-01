require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'


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
