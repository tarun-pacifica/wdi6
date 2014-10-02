require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

get	'/' do

	  if params['movie_title']
	      @title = params['movie_title'].gsub(' ','+')
	      movie_result = HTTParty.get("http://www.omdbapi.com/?i=&s=#{ @title }")
	      @movies = JSON.parse movie_result
	  end
	erb :home
end

get '/results' do
	binding.pry
	if params['movie_title']
	      @title = params['movie_title'].gsub(' ','+')
	      movie_result = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ @title }")
	      @movies = JSON.parse movie_result
	  end
	erb :results
end

get '/results/:id' do

end






