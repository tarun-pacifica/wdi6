require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'pry'


get '/movies' do
	erb :movies
end

get '/search' do
	erb :search
end

