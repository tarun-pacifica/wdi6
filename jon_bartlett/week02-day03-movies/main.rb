require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'uri'

get '/'  do

	erb :home
end

get '/search' do
	film_name = params['film']
  movie = HTTParty.get(URI.escape("http://www.omdbapi.com/?i=&t=#{ film_name }"))
  @poster_url = JSON.parse(movie)['Poster']

  erb :search

end