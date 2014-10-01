require 'sinatra'
require 'sinatra/reloader'

get '/' do
	@stage = "test"
	erb :pair 
end 

get '/:stage' do 
	@stage = params[:stage]
	erb :pair
end 
