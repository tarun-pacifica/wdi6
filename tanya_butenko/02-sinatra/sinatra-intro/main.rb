require 'sinatra'
require 'pry'
require 'sinatra/reloader' #reload the server by itself

get '/' do
	'WELCOME TO THE ZOMBO COM'
end

get '/hello' do
	"Hello world from Sinatra!"
	
end

get '/goodbye' do
	"Goodbye cruel world"
end

get '/hi/:name' do
	"Hello #{ params[:name] }"
end

get '/hi/:first/:last' do
	"Your name is #{ params[:first] } and your last name is #{ params[:last] }."
end

get '/hi/:first/:last/:age' do
	"Your name is #{ params[:first] } and your last name is #{ params[:last] } and your age is #{ params[:age] }."
end

get '/calc/multiply/:x/:y' do
	result = params[:x].to_f * params[:y].to_f
	"the result is #{ result }"
end











