require 'sinatra'
require 'sinatra/reloader'
require 'httparty'


get '/movie' do
	if params[:yes]
	@yes = params[:yes]
	result = '/search'
end
	erb :movie
end

get '/search' do
	erb :search
end


# HTTParty.get is a HTTParty::Response