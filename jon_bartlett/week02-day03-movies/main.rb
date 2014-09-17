require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'


get '/'  do

	erb :home
end

get '/search' do
	film_name = params['film'].sub(' ','+')
  movie = HTTParty.get("http://www.omdbapi.com/?i=&t=#{ film_name }")
  puts "http://www.omdbapi.com/?i=&t=#{ film_name }"
  @poster_url = JSON.parse(movie)['Poster']

  erb :search

end